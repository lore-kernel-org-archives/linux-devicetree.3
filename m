Received: from outbound.pv.icloud.com (pv-2002g-snip4-4.eps.apple.com [57.103.64.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AAAB63D7D77
	for <devicetree@vger.kernel.org>; Fri,  1 May 2026 15:56:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=57.103.64.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777651016; cv=none; b=LWcPYrUJ3e2vHA2guUuJifvG3F7cD863OUNnQxMyWYyehX26GYytAJ8v3ozLJ84RcgtOuCWZzPuuy5dVapmSBmYp8SazMry6mCPH5XPE2s9yphUkLe0VVWpgWe+F+2qYEgo88s6PCNBPmpLzpSIKh9DYRzH3CqMZljNLZGQ4N4w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777651016; c=relaxed/simple;
	bh=qZO++AW+SjOK5e+Ph98lgPCghawvUhDVv9lAanS78rE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ZmEnq5ilmT0d7yVjinvIFmxSo+QJpso9Zga2QrKO+dgjEVgi8iqTJ5dOEfdme2NnoygxG1rZ4HkLjC9uMLfd8lzjdTOqxpm5rawhCN73u51sKEgOgEuNqu4muy1FD3K3w3IlGjlzFdR5wcOG6zyzh2/bCovGyjcyuDqKps2CX2A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=etehtsea.me; spf=pass smtp.mailfrom=etehtsea.me; dkim=pass (2048-bit key) header.d=etehtsea.me header.i=@etehtsea.me header.b=Bsc9V4SQ; arc=none smtp.client-ip=57.103.64.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=etehtsea.me
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=etehtsea.me
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=etehtsea.me header.i=@etehtsea.me header.b="Bsc9V4SQ"
Received: from outbound.pv.icloud.com (unknown [127.0.0.2])
	by p00-icloudmta-asmtp-us-west-1a-60-percent-4 (Postfix) with ESMTPS id A16B5180036C;
	Fri, 01 May 2026 15:56:54 +0000 (UTC)
X-ICL-Out-Info: HUtFAUMHWwJACUgBTUQeDx5WFlZNRAJCTQ5AHVwDWxxBAFYHXxcOVk1UGVoBdw5GFVEMQAhWRV8VGR5XUFoKWxx5HUcIXx9BFVhWXggXGVFNAFhbCFsEDx9MDFECQgVWXkkOHQRUB10FXVZQAlpLQgRLRWhcBVwcQBdIHV9qS1YUBB1HCF8fQRVYVl4IFwZbFAREAV0FXQJFCUkCWAJdA0IXTQdUB0YBXVQZWgF3DkYVUQxACFZFXxUHWEcURw4PE0wLRwJaNFYfVBlaAw==
Dkim-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=etehtsea.me; s=sig1; t=1777651015; x=1780243015; bh=dntdEFDWxjXy/LmalH3hxVPeMgYpq5DiHci9+hlv5EQ=; h=From:To:Subject:Date:Message-ID:MIME-Version:x-icloud-hme; b=Bsc9V4SQMDpDQeJzFPGU20vcjQUoz0p3E3KdtaSXsnLIaWjwLui3oK6sInO+UJrT60ZX2X+cyMBj0JNCVYczYRd+I0DgqxC4Kh89QoZongXaEb2XohbK4YQiIA0eWmNOnSvsbPb+muzxeM3a2A6rlFADzqXU63RtmFpZNEUyx9cUFhv+Q0S32hWeeRdzgc3FtmX7kcbRQ59nqgXEqucWWMo92n0HeeMtRM4ZZZmLK7lLzqQuehRpA2Ei+h+3r8EeYXeFcqtRk0OxYaf5B7o0/K5vBksPyP13EfSJ/OfHAxi8LVhAH3OZOfRNIJ0LCU1jcIu+Ji5rPSVJxXmNgShSbg==
mail-alias-created-date: 1634905887181
Received: from localhost (unknown [17.56.9.36])
	by p00-icloudmta-asmtp-us-west-1a-60-percent-4 (Postfix) with ESMTPSA id AA93E18000BA;
	Fri, 01 May 2026 15:56:53 +0000 (UTC)
From: Konstantin Shabanov <mail@etehtsea.me>
To: Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Konstantin Shabanov <mail@etehtsea.me>
Subject: [PATCH 2/4] dt-bindings: arm: qcom: Add HONOR MagicBook Art 14
Date: Fri,  1 May 2026 22:56:10 +0700
Message-ID: <20260501155612.5490-3-mail@etehtsea.me>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260501155612.5490-1-mail@etehtsea.me>
References: <20260501155612.5490-1-mail@etehtsea.me>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: KjQpAZI8koi2in5Qt-rFxbA_ijLgK4gm
X-Proofpoint-ORIG-GUID: KjQpAZI8koi2in5Qt-rFxbA_ijLgK4gm
X-Authority-Info-Out: v=2.4 cv=Zqjg6t7G c=1 sm=1 tr=0 ts=69f4cd46
 cx=c_apl:c_pps:t_out a=azHRBMxVc17uSn+fyuI/eg==:117
 a=azHRBMxVc17uSn+fyuI/eg==:17 a=MKtGQD3n3ToA:10 a=1oJP67jkp3AA:10
 a=NGcC8JguVDcA:10 a=VkNPw1HP01LnGYTKEx00:22 a=XA9NUab8Z8PrMTk6cLIA:9
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTAxMDE1NiBTYWx0ZWRfXwm0ZIpR1mPWa
 sBJwshIHS/C7lqB9nCEVs2t6BQRMY90o7wrVfUpCMdlmmEb6F8X9zjmPk5jzHwGGG3TBYx3RFRP
 pXlEjJ4oXeHlu8Qw52D6zcTsAgo9/tPzOBza9/62W8X5U2HMk8MuTQoZwxNixppYL/0LuvUjaAX
 Oo2EuLfbmpKhVgVGg8Ks/zSM7HSx0lwCMFmDpWa8GkikLbdV2fyrGta8rQNEqlNPDxfKTWqGi0D
 4mMK9f+pY/yAB3KjjCHNziom3vBBL0zArDaO0nax9eh5MHoJd0YpLaevTdbHgiWMVarmqXhGqXx
 H0UDhS/MG99w3QEt4igkTiSLYNEVvmVwpAlPzsOcTcaCgLBa5V9hd0Iz5kgtR0=

Document the X1E-80-100 variant of the HONOR MagicBook Art 14.

Signed-off-by: Konstantin Shabanov <mail@etehtsea.me>
---
 Documentation/devicetree/bindings/arm/qcom.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/arm/qcom.yaml b/Documentation/devicetree/bindings/arm/qcom.yaml
index b4943123d2e4..f5401c9c4775 100644
--- a/Documentation/devicetree/bindings/arm/qcom.yaml
+++ b/Documentation/devicetree/bindings/arm/qcom.yaml
@@ -1147,6 +1147,7 @@ properties:
               - dell,inspiron-14-plus-7441
               - dell,latitude-7455
               - dell,xps13-9345
+              - honor,magicbook-art-14-snapdragon
               - hp,elitebook-ultra-g1q
               - hp,omnibook-x14
               - lenovo,ideacentre-mini-01q8x10
-- 
2.53.0

