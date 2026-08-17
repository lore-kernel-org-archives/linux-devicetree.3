Received: from mail-oa1-f42.google.com (mail-oa1-f42.google.com [209.85.160.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE1633515D1
	for <devicetree@vger.kernel.org>; Mon, 17 Aug 2026 00:00:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786924839; cv=none; b=Ts+BgLgewAZfrOeNHuX2L8HaI9CgzS8VCMdi+sfp9vE2ieHHfjUowhHSqiJ03aRLPmtejXR3qSVbNisKB4xOGMA9eEuH5cVJqqQ82gRlsX0DvYzMI4XnF3cvsCstX1lfm2ju1qnR7d1skvF8yIRjcwsikXC6wPgRMFJqCNOQN00=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786924839; c=relaxed/simple;
	bh=R4LaImY/2T66WrlPaQnoTaMqE3LDAYsVdXsxUsoQMts=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=QZzZC0hazilTPayZ1054dB4+I4D/nM284LWupfPS8BAh1aVaOTKU9dDAbTKyzJGp6neXMFtunD7cI7IFeL1itt9kusGrhRRDuG8nZTY0S8GwPeWVUzkElfV+UDbx73eJuEzS3HcT4AFDO6ZGpZsim54XN3qpiix1pDf+eMTRWrs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=r3CPhCiX; arc=none smtp.client-ip=209.85.160.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="r3CPhCiX"
Received: by mail-oa1-f42.google.com with SMTP id 586e51a60fabf-456f7012050so2646661fac.0
        for <devicetree@vger.kernel.org>; Sun, 16 Aug 2026 17:00:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786924836; x=1787529636; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=NGDW8YHqJRyxuOShb3YiQbckQHmyOYQ8jIzHmdrCgnM=;
        b=r3CPhCiXXkR0suOT1mSnrs188I3B2ZXVUdkNH+syl4ysJ61KamnbTLe/lqpGDOSrqP
         4i+8NVL4+EuFDqX9wYCv7A6HzixdbmLWEIqugcJrSR/L0pAvjOleyECmziaznfCrc1HT
         C/SFEHO3w0VpS8lxHGk6OtQCt1wQsnbfWsYhc5Mkq5AA6AwyZwMObaASnl//3o+2N2O/
         IaYL4TgcXqutHPJYfnrUkNF12/12eIJ9ev7Zo8xddB6N/bgT/KBaCimdwTQ3F950Bckb
         BvjPIPo+IthecXfZJEeDSaclTamHU7ak68F9+Jvy08AEwUiz1k+BA48ZxJXq2qV+i3dy
         pQbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786924836; x=1787529636;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=NGDW8YHqJRyxuOShb3YiQbckQHmyOYQ8jIzHmdrCgnM=;
        b=iZ8SXqZ8QY9gCzxSS7Qop26zbys0vEBsM6NZAsUGKHlS6i+WdSFXNMqkk3QHNGDZIK
         xI4mCM2gKbZykmX2nmhmGMaR2+TWxtErNgX5/Kgit4zkcY90Sq4Ujr7IXPJ7E0fgyEA/
         3im3Lkx8oip7vcymqaF1IiJYVd0jLdEeTcEh1by5rzNF/U5p1PeQCCc0P0fbrDYHAsMP
         OeVatW9m/M7eiJhjbmTBF7OcXSEkb3b3BuKzz3nA8VQXuFgqyWLk3auEGYaZEcQ8+JEt
         BKTS3B2yX/TXSDBJIxVUj0Jxv0TIw3H5/mhV8YnZQyF02jI5ne0Nxt9zO3vyMLVlH9xr
         OzKA==
X-Gm-Message-State: AOJu0Yz08a2e4dMk9gcamth8THbEzm3Pmndfdl7LCA3gJq9gsROmbmLt
	XRgccJjXCuZxrrc4C9AT7e5zsYKzhMb9yloBsiDk6GdQ1bYK/NsrV3R2
X-Gm-Gg: AR+sD12vSn8RIVK1E7PV1JmZX4Px/rSXlC8KtPeZgPoB/GSf/mTctLuqxVFYr1tQx7f
	sxGFTEVMKDRqkrlavB2b/fxq8E+U82PJ8M3ZmYNbQu457v+F30tmiz0ZWSvErO9ED71rJNVdroz
	N+NJoEA/0M61jR4TIo5Y9x5KJfJLB7u3c1gb1dJNBIlLHcGLpD9aqXxLg+1tvfk+ISY7idZQPQ7
	W5OH+ZCUWjtppxYPED/hzvoM4wxlfzOImDjnlCX2LVo95uai7NaPZWQ9ClmqnYUUe+647lDcyU0
	6gG0gzO2RG5sFiA20g3X1m4zTlmqXL/RiUAdtTBSeqLiqff+4RxuJrm6pwp9bcvYO3YrJazd4+W
	x3Ex6LPzJHMl92uzDs2zuwPOB5frXWSXo6SBTnU9hms7NsriOK7v0dXkqGCedt6v+feXAIzV+m0
	n+P4iNNatqg0zG5L/REFZhPJWa46M2ze/iBaMe5llw/s4LzGdOtXOBK+at67tDQzWtmO9G1jgwp
	1tpUxO/z+OGM5qicA4UEm26VvhB5GsUNB63d6rBjNvfzIxYlku3YHowJHIeAqlCFyqNh1pUrIVc
	mvjR/je1mEFoEFFKZ82wvgPZV+lIBY2igbSJ+8RWViQ2zkppwlsfEeGv4alumSB0WZAjTBuHZ+K
	PRVDLdUkJs3kTyc8A
X-Received: by 2002:a05:6808:10ca:b0:4ab:25f0:1a8d with SMTP id 5614622812f47-4b240453a64mr13286027b6e.16.1786924836477;
        Sun, 16 Aug 2026 17:00:36 -0700 (PDT)
Received: from [127.0.1.1] (184-96-154-59.hlrn.qwest.net. [184.96.154.59])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-4b2714dc18asm2556802b6e.17.2026.08.16.17.00.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 16 Aug 2026 17:00:35 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Sun, 16 Aug 2026 18:00:28 -0600
Subject: [PATCH net-next v2 1/4] of: property: skip links without a
 consumer node
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260816-submit-phy-package-fwdevlink-v1-v2-1-23e55dd59fad@gmail.com>
References: <20260816-submit-phy-package-fwdevlink-v1-v2-0-23e55dd59fad@gmail.com>
In-Reply-To: <20260816-submit-phy-package-fwdevlink-v1-v2-0-23e55dd59fad@gmail.com>
To: Rob Herring <robh@kernel.org>, Saravana Kannan <saravanak@kernel.org>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 "Rafael J. Wysocki" <rafael@kernel.org>, Danilo Krummrich <dakr@kernel.org>, 
 Andrew Lunn <andrew@lunn.ch>, Christian Marangi <ansuelsmth@gmail.com>, 
 "David S. Miller" <davem@davemloft.net>, 
 Heiner Kallweit <hkallweit1@gmail.com>, 
 Russell King <linux@armlinux.org.uk>, Eric Dumazet <edumazet@google.com>, 
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 driver-core@lists.linux.dev, netdev@vger.kernel.org, 
 James Hilliard <james.hilliard1@gmail.com>
X-Mailer: b4 0.15.2

Supplier bindings can map a property node to the device node which
consumes the referenced resource. The remote-endpoint binding uses
of_graph_get_port_parent(), which can return NULL for a malformed graph
node without its expected parents.

of_link_property() currently passes that NULL node through to
fwnode_link_add(), which dereferences the consumer while adding the
link.

Only create the link when the binding resolved a consumer node. A
malformed graph property then creates no dependency instead of crashing
while fw_devlink parses the tree.

Fixes: f7514a663016 ("of: property: fw_devlink: Add support for remote-endpoint")
Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 drivers/of/property.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/of/property.c b/drivers/of/property.c
index 72cf12907de0..38c0c7dc428a 100644
--- a/drivers/of/property.c
+++ b/drivers/of/property.c
@@ -1620,7 +1620,9 @@ static int of_link_property(struct device_node *con_np, const char *prop_name)
 
 			matched = true;
 			i++;
-			of_link_to_phandle(con_dev_np, phandle, s->fwlink_flags);
+			if (con_dev_np)
+				of_link_to_phandle(con_dev_np, phandle,
+						   s->fwlink_flags);
 			of_node_put(phandle);
 		}
 		s++;

-- 
2.53.0

