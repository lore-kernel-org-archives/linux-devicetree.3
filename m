Received: from mail.auroraos.dev (unknown [95.181.193.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F292F37E30F
	for <devicetree@vger.kernel.org>; Wed, 29 Apr 2026 20:29:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.181.193.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777494594; cv=none; b=gIAXkyxT2QV6MX3mkYWzpJFCNhc+RQt79JqchQiNdvu5YMP+lKDcOhFQZbVq0dsCDwWa2lasVC0UxKokyPa3dltfLN9HYVjxwy7Qxii5lyTLG0Zmn8DXTZWhrni1sizpipvbqX+hNP16miSU0qNpRvFvVgGFuQ94dZYRkRxA2DM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777494594; c=relaxed/simple;
	bh=UnIb7WXariyi+q3labZn1TgnVVccAMmJBqKfFFw6NuA=;
	h=Message-ID:Date:MIME-Version:To:CC:From:Subject:Content-Type; b=O4lUXhPgt8XMVLLk9lQGxOrTrFTyWKWiwijV3iasPdPCy2R2wc9ake91i1hFluxntdTUZ0bRG4qdSWVSNqPQyKdkxQKD3cjXvm0IeTJLlB9YMJufzdQsNAE2qAVM6G4ZvkOGL++Mmm4nNTevtngxDTQwdmHBYpfC/9zWRecPesM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=auroraos.dev; spf=pass smtp.mailfrom=auroraos.dev; arc=none smtp.client-ip=95.181.193.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=auroraos.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=auroraos.dev
Received: from [192.168.2.104] (213.87.162.78) by exch16.corp.auroraos.dev
 (10.189.209.38) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1847.3; Wed, 29 Apr
 2026 23:14:39 +0300
Message-ID: <0c7bf7e9-887c-42d5-bcfb-0ba7fe1e70b6@auroraos.dev>
Date: Wed, 29 Apr 2026 23:14:39 +0300
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: <devicetree@vger.kernel.org>, Rob Herring <robh@kernel.org>, Saravana
 Kannan <saravanak@kernel.org>
CC: Grant Likely <grant.likely@linaro.org>, <lvc-project@linuxtesting.org>
From: Sergey Shtylyov <s.shtylyov@auroraos.dev>
Subject: [PATCH] of: cpu: add check in __of_find_n_match_cpu_property()
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: exch16.corp.auroraos.dev (10.189.209.38) To
 exch16.corp.auroraos.dev (10.189.209.38)

In __of_find_n_match_cpu_property(), checking the variable ac for 0 won't
prevent a possible overflow when multiplying it by sizeof(*cell). Besides,
of_read_number() (called in the *for* loop) can't return correct result if
that variable (which equals the #address-cells prop's value) exceeds 2, so
additionally checking for that seems logical...

Found by Linux Verification Center (linuxtesting.org) with the Svace static
analysis tool.

Fixes: f3cea45a77c8 ("of: Fix iteration bug over CPU reg properties")
Signed-off-by: Sergey Shtylyov <s.shtylyov@auroraos.dev>

---
The patch is against the dt/linus branch of Rob Herring's linux.git repo...

 drivers/of/cpu.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/of/cpu.c b/drivers/of/cpu.c
index 5214dc3d05ae..bd0e918d6f29 100644
--- a/drivers/of/cpu.c
+++ b/drivers/of/cpu.c
@@ -60,7 +60,7 @@ static bool __of_find_n_match_cpu_property(struct device_node *cpun,
 	cell = of_get_property(cpun, prop_name, &prop_len);
 	if (!cell && !ac && arch_match_cpu_phys_id(cpu, 0))
 		return true;
-	if (!cell || !ac)
+	if (!cell || !ac || ac > 2)
 		return false;
 	prop_len /= sizeof(*cell) * ac;
 	for (tid = 0; tid < prop_len; tid++) {
-- 
2.53.0
