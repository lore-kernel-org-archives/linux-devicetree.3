Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.42
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794864484;
	b=X96GvefjKhf18d4LqnsVqCfB4yOXxGrbqyyfC7qDyOah8IGj9xpKckZSZAeNwqqzjrH2
	 AH8l+PzBU8oJ7wsPkXYwatbNgRTuY+o9kxKvdcphT9jmmr2djFexli1qsTQssMQGmhA8l
	 BYt+s7QVBOY4YwJbeVidIquGZj5JG3vV3JJxu6GSzJrvnORPn1NlYecXLfn9YLNitKlvA
	 j3u5Hame+2tk554Yzogs3xSNfCr/osGeC+UDQ0lj8XuQ6MCa1GcP1J64Ywrv44Cy/Sf2t
	 nOdCDYcjYOsBLE1x4g369aGWyjZFdFPlv+a7TpOvp2I0rvIWZE8iuBzvr8kKC9oVqkQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794864484;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key;
	bh=8TdMvk4MSLOM7B2AUfqYT5uxdywhrc23UXtZE8vgWzQ=;
	b=3oa8p1A7ThZNprhQ4AmFVI4AbcU8do5NyMZxrdE7hNWCQN9UnS4ddaXnfRxQpv115vVw
	 Bp/0KzCwN0Kz0kQlYaryJCyW6d8RDvWRv0N2ICaMviiqxaVYJIvQjTii5CdhajeZCPDRo
	 X5G7yJX8LrpL1zZYw+ZU4SSTSHzZDr5XddhiJpOQ0WVbpJDeOV7UTESwwhiumHGrqLxD6
	 eO9iRqs5sAikei1P2PxrzNZxEMy7SiBHDif++CaM88QYCXWZo/38g9yT2/oOB9KeF6uFc
	 +lzZN6UAyQwJBuwdWpJigyrrz8iz6KHi+4+bRksiiyqmPlvdOEO+ue6cUhdKkq248aA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=UGH3kEag;
	arc=none smtp.remote-ip=209.85.221.42
Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A9751606A887
	for <devicetree@vger.kernel.org>; Mon, 16 Nov 2026 21:28:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A9751606A887
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=UGH3kEag
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-490585eddfcso2811660f8f.0
        for <devicetree@vger.kernel.org>; Mon, 16 Nov 2026 13:28:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794864482; x=1795469282; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=8TdMvk4MSLOM7B2AUfqYT5uxdywhrc23UXtZE8vgWzQ=;
        b=UGH3kEag7+QnSPw8NgN0my144BL9MI6P+lzS4lSmWpGQLU/I1Wj2jG9zLis6cKkcyN
         ttu90mcZBjnspWeaKA1sIRwB9cdXaff25bi0pIzo2nlZOYJTE5UudY0yiqgN+oIc1Gk4
         27gWEvQJDPseqUIJdZV/bKhN6eyFQZ7udD/C2KLm+okaF7uw60hj4NRq7HAVpwg467V9
         MmOa42/K0JqbfZnd737Yd7PfrKLwppbtes0cyHasCRpOwm/EKfvIwi9YyvfmdII+iysG
         TW0GSAVvcD/jtsTLZMB/5KuH/HSlooTeqSEMLMXw4y/dOpM0oYUhyTRXoRWTIM99mqwk
         kqPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794864482; x=1795469282;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=8TdMvk4MSLOM7B2AUfqYT5uxdywhrc23UXtZE8vgWzQ=;
        b=05umwfNT0DWacKPEHmudbl3pwOWVt8j0U9V1+ESMrK7ImU523WCqROsmt2ZZ1LPm52
         5WZlyLOPK01fM8XLaLJ4r3Pog0P+4TCtPawnG5HvEYO/LHBQESfyHeyjyr5DmFgHADRy
         rWWYWTSNDs/bId6Njr8AMRDrjTjkL9hlZdoEnVC2UOlaHFvYTMZg+MGVfGozWrnFr/CO
         5pC7zFku7lGhkMw8TGZRdNrFVGjOELtSxBXq9OrkEato5ZUikk/+zOAMuX999aQJKI3V
         Vn+2AWQDKJ9OOslZ9GCeGUrROY62MzNGlu2WHYdCynAL3M24eQ0jb9x6QtZzFt/jeSNb
         eyOg==
X-Forwarded-Encrypted: i=1; AL+hErGqr5+73EwW8OoxLRDpjz3emz5dgfSqd/9wOwpuw2UbLb/pltgk1ya8xAIB6bUvpsx4cu1WjUUnf3ZJ@vger.kernel.org
X-Gm-Message-State: APuU4Z8sOAj4TEF6j/cZPl+fvQH8JqbPfsy4WPTPfX4GPCW0x/Gw3Trm
	Ij39wJAkP889mthgYwNSE03LiWqtzZslrDYSdX7fHTUGxeHv3lneEklv
X-Gm-Gg: AZFdTZc+YQJisqyQ4bVqXGCyQ0xIuWilmSIujvQc07zsysXVLosf09biU0BrVKtPMkR
	Cl1A8sjaLQAL7kFTMIMWBZ7/uBUChRSnCroVl4G/a58w1nQVntvJfFDwYUX52ejzqBkVUYAC7vZ
	ZIvz4HFd0Fufi5zk9y4Bj0hJIkH+o+xNPIhsNnjQFjefQ3mNFZ/68l1I29FUaMHFTKTQj2Zrd1f
	uF8BGRm2iQqWUDkMTfUWZjfNkDNFR+kRf04cfPX81UJMy6zoPCj227IrZKYLQC21DDU+yTc6PHf
	7IOUz8vyD8I7CIDpTPr5OefsqmAymLTQpYPA+AdUEcT0TBsKxQl9V9+TqIXpq82oPesOGbaTA6s
	bAe/zCx31x/bM1V0c4UMwHfh82Kg7JCLMDJRjXOyKqgAwBqQQS5cipWMhG2raY35FMMFOeuilXO
	tkJnFj8Am3fSDNBBYnm6fU9W6JcCuhu4Uc697L8RBADjox97430EJc1WOR8eF9DPAM016xOOP93
	6v3fM3Nf57qda4hvYDZiAwnaH7LmXUszBTOuhxuTl5Ahu6Qwy06moUfqlAwa4oDk8apXSLOUVGU
	3HnTHU3oDu4HL9qFS0RndbTuUb/EdHTx8eKScx9J
X-Received: by 2002:a05:6000:5c7:b0:48d:f996:1814 with SMTP id ffacd0b85a97d-49c7325b40amr23107019f8f.57.1794864482125;
        Mon, 16 Nov 2026 13:28:02 -0800 (PST)
Received: from [192.168.10.105] ([212.58.121.92])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4a378138cfdsm1260150f8f.58.2026.11.16.13.27.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Nov 2026 13:28:00 -0800 (PST)
From: Stanislav Aleksandrov <lightofmysoul@gmail.com>
Date: Mon, 16 Nov 2026 21:26:30 +0000
Subject: [PATCH v2 14/16] soc: qcom: socinfo: Add SXR2250P SoC ID
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261116-halliday-dts-v2-14-2c92438c6c46@gmail.com>
References: <20261116-halliday-dts-v2-0-2c92438c6c46@gmail.com>
In-Reply-To: <20261116-halliday-dts-v2-0-2c92438c6c46@gmail.com>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Abel Vesa <abelvesa@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Robert Marko <robimarko@gmail.com>, 
 Guru Das Srinagesh <linux@gurudas.dev>, Thomas Gleixner <tglx@kernel.org>, 
 Radu Rendec <radu@rendec.net>, Lee Jones <lee@kernel.org>, 
 Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>, 
 "Joerg Roedel (AMD)" <joro@8bytes.org>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Wesley Cheng <wesley.cheng@oss.qualcomm.com>, Vinod Koul <vkoul@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Manivannan Sadhasivam <mani@kernel.org>, 
 Alim Akhtar <alim.akhtar@samsung.com>, Bart Van Assche <bvanassche@acm.org>, 
 Bean Huo <beanhuo@micron.com>, Stanley Jhu <stanleyjhu@google.com>, 
 Herbert Xu <herbert@gondor.apana.org.au>, 
 "David S. Miller" <davem@davemloft.net>, 
 "Rafael J. Wysocki" <rafael@kernel.org>, 
 Viresh Kumar <viresh.kumar@linaro.org>, Amit Kucheria <amitk@kernel.org>, 
 Thara Gopinath <thara.gopinath@gmail.com>, 
 Daniel Lezcano <daniel.lezcano@kernel.org>, Zhang Rui <rui.zhang@intel.com>, 
 Lukasz Luba <lukasz.luba@arm.com>, Georgi Djakov <djakov@kernel.org>, 
 Sibi Sankar <sibi.sankar@oss.qualcomm.com>, Ulf Hansson <ulfh@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, mfd@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, iommu@lists.linux.dev, 
 linux-usb@vger.kernel.org, linux-phy@lists.infradead.org, 
 linux-scsi@vger.kernel.org, linux-crypto@vger.kernel.org, 
 linux-pm@vger.kernel.org, Stanislav Aleksandrov <lightofmysoul@gmail.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794864382; l=679;
 i=lightofmysoul@gmail.com; s=20261108; h=from:subject:message-id;
 bh=6bC47xmeKrVS8XaUkfpVIXGQqamVpsrDydmAXACmpko=;
 b=L3bECMGWqB70KSAXliPLAtrm9JvwyHz3xUlIS/JSaVuyDRybXKh4TJZIKniI807WZa1pL3+Ja
 bm5mXrDXMYUCX9Qe7poGqRt5BD+3P/4++4UczCRJAuB1UHs6hFIK/pI
X-Developer-Key: i=lightofmysoul@gmail.com; a=ed25519;
 pk=jeRUlfmkhE53CJPoeIIXgu7rTE0ybDRH0HQrEwbydzg=

Add the SoC ID for the Qualcomm SXR2250P (Snapdragon XR2+ Gen 2).

Signed-off-by: Stanislav Aleksandrov <lightofmysoul@gmail.com>
---
 drivers/soc/qcom/socinfo.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/soc/qcom/socinfo.c b/drivers/soc/qcom/socinfo.c
index 38efc5db7fa8..c5b61d28fc9d 100644
--- a/drivers/soc/qcom/socinfo.c
+++ b/drivers/soc/qcom/socinfo.c
@@ -529,6 +529,7 @@ static const struct soc_id soc_id[] = {
 	{ qcom_board_id(SM7635) },
 	{ qcom_board_id(SM6650) },
 	{ qcom_board_id(SM6650P) },
+	{ qcom_board_id(SXR2250P) },
 	{ qcom_board_id(IPQ5321) },
 	{ qcom_board_id(IPQ5424) },
 	{ qcom_board_id(QCM6690) },

-- 
2.55.0

