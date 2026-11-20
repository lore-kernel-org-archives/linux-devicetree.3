Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.45
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795190095;
	b=nEpLbH/B8vZ+d2LhbZkw0HoPxc7uaPsvhlYJpHKz+Uinia/LyLdiJNb/Vrxxl3Ml/ujh
	 x3TOwk5Hd7ihZjsYxMwbu3s3gufBOpQYCC5LISfcn19S0HJgw3SFKAPOIm2fzwG2GzcfB
	 i7BBOGTJpf7D4uY3oj5FJ0WtVZD20YZJ+VTz8/SHvsig+QUSbOVbeFrAkBAMDwu65OWor
	 NkqGw5quVFVrw6QyIsfeoMxlaP5yH5AUbrXIi+qQkVf7T6vMTVtoFvClLGaSLdy3CJt41
	 pXfiO5EzE3aOUCOJkDUoTatnP/s5+Wz5ouMBC2v8Hk/YDawZk2iMydvMkIurHgerSeQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795190095;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-Id:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=YcT3yZc29jCRS7MnDgeTGGcWUyCQ1FNb6W/JHHtK0hQ=;
	b=ogo/HK0IM2Cc1X6G+/pMPadgKDWsfhLAAo5+R/0D7Tl5lW+VNexsqB9MnGApFmaNOcr8
	 Ys0tENKdAZVX3mn+qc099mzoEz3EC1p85zA002adpeg61tml3iCxRsY6VTiEu8lRzM5pZ
	 dbiQQl5DSbqbWsHRHXyyvN6pXc4k1JAW4oiQIe8egPm4DKWfhs54o1gngKEizwf67fnUe
	 jpXBdNQ+ic6t1Q6YBLD2XU4Enps/LUOdWGhq7fJRANqxnnYMaUBXiOtAJCuuhWVIf++yW
	 LeaBWYKJyn0uzABL5mfqqOvUFAK9gKbdz3nZYaVxxr6ikZGbG9vWg/6pycILbWKj+Wg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=C9ymzV1n;
	arc=none smtp.remote-ip=209.85.128.45
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D0F3A606A337
	for <devicetree@vger.kernel.org>; Fri, 20 Nov 2026 15:54:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D0F3A606A337
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=C9ymzV1n
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-4a5177d78c7so9889785e9.2
        for <devicetree@vger.kernel.org>; Fri, 20 Nov 2026 07:54:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795190093; x=1795794893; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=YcT3yZc29jCRS7MnDgeTGGcWUyCQ1FNb6W/JHHtK0hQ=;
        b=C9ymzV1nmJJShkya7UcSKR6iPDN+n6RuxSd56u4zS4owB/0cvJp3RDW67ws+Gmp9Oy
         JxkSDl1mw5dfJV7cYJf1CnuPNq33/dywYRPcs51Z/1PqES9VB53htY2kCtrGZZHijOLx
         teyhPFNnnKYqEPMEQZo5lIg+/YPMVhfYBIqmI3bq4n9ha6d4mIcSse0j+8r3/ZHFpyFr
         WeiAvffXOcPc1haHpB4IMFkmCXmC9Y4WOziIjRLOEMZil0DiqeOpJQF98Br5cMKFdLjB
         bP67IuLd2gKNBPlgGiD1S+FbgLuFU+Bup66zVZR6ib61yBQMSNyG+iFQHkMB8KJy6+j4
         eDiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795190093; x=1795794893;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=YcT3yZc29jCRS7MnDgeTGGcWUyCQ1FNb6W/JHHtK0hQ=;
        b=niO6Bv+Vy7HjljtzQXPUXlxvjD1zFgF5k9rMAV6mJ0bDVijgrGKWjZGUehdBT5p7Vk
         B1t/R0exfypKwohcHB5VZBpOPuCKjeITK93ZVtX7pTziDO7afvDZK5mJwyVE0QIskZK6
         dDt+HJT+K+N/lZIxbzJuznRFniffsEhnQY6qc3nTHr7dvtv5dwyfxoPY6Sz3wNy8e1t9
         RIhKXq71jDQkcNwstcbNs/i3UjlkGYt/IFb3udeCWAlVPvsbpEVgF6j6VwgeVUNPs8rE
         OJx8FlFUDMdAnjNXY5Kf5BEeawnDP6tUQZOqSHbu++k404ridvUqDeamEGLx5ustqOf8
         qrKA==
X-Gm-Message-State: APuU4Z9BaJ05e0d//vktvq0jccE/LFjf+7Ngpb27Km4fQs4QOkvTIDrZ
	fz2sM7XAH5GHMXX3Av2cSG4gvVqENeyLvHaQA/ow+04qZPK5brUKSDbC
X-Gm-Gg: AYBFou3Nnz7WWygu491rGYQBOhHRTs5X8tUJbR1EgFmNO7t2spBjxBZMAxEN6Wt9FUm
	VWJ/GKb4wYKjCqlrzKkXR6a0lZh/5mTjhST/ayWmfxWg6HGQHzBXA4VcpYf9YexigYWSXPqNOJS
	5HzgZxBJ3LgJE9ZkcmuAE9f/D5QnYXsoEsP4x53WFAsEmIP56okY8PSc3KMRareWkiNap6StimH
	vnmZfr4DfM+qejBlH8GXhIifzHt/mMi8QRVPCqrdWSc+YIMrw+hISQiN5514OXmd+Lr4wkG7wQf
	bZzS3Kk4Wtyr+/oikwuEdvryuELDlPf3CNyoSa8oXOKI/CHrTS7tWPwiI7/fFS1STbD3FOBCm1q
	OAR3N3ERHBZqG5y3d8E7DYSkWIQVJCGAEcvq5wIigT6+yxEQh+wkBAbMAZxtNC1APLKzitDvI/y
	e5Gsfegp1vap8rNzI1TlFip3NFe3ak4DOfhBh8wD3ZrUh1R+C4sna9sLd41qTOqkENoKyDv48bA
	kpC14gmHq6/l4Mjo6gaOwqvIm2jt70v/ZuF86mlY8OcSUuWm6TAXUMHbss44oUNRw4OrABU1Ceq
	Wvig04Dts6CcVGwqfOIAt4hp8JEJXOaHZ3nqmsXDzRUC3+sBvWWipENvbP28RssSmZEJd2JXmNM
	=
X-Received: by 2002:a05:600c:3547:b0:4a3:5991:718 with SMTP id 5b1f17b1804b1-4bb88809795mr76390745e9.16.1795190093061;
        Fri, 20 Nov 2026 07:54:53 -0800 (PST)
Received: from DESKTOP-BJ3EVC4.lan (178-164-182-185.pool.digikabel.hu. [178.164.182.185])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb884a15absm83982635e9.9.2026.11.20.07.54.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Nov 2026 07:54:52 -0800 (PST)
From: Abdur Rofik <rofikcoga@gmail.com>
To: linux-arm-msm@vger.kernel.org
Cc: devicetree@vger.kernel.org,
	phone-devel@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	linux-input@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	Abdur Rofik <rofikcoga@gmail.com>
Subject: [PATCH v5 01/10] dt-bindings: arm: qcom: add LG V60 ThinQ 5G (timelm)
Date: Fri, 20 Nov 2026 16:54:40 +0100
Message-Id: <20261120155450.7719-2-rofikcoga@gmail.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20261120155450.7719-1-rofikcoga@gmail.com>
References: <20261120155450.7719-1-rofikcoga@gmail.com>
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Document the compatible for the LG V60 ThinQ 5G (timelm), based on
the Qualcomm SM8250 platform.

Signed-off-by: Abdur Rofik <rofikcoga@gmail.com>
---
 Documentation/devicetree/bindings/arm/qcom.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/arm/qcom.yaml b/Documentation/devicetree/bindings/arm/qcom.yaml
index 121ca557ce1ef..85635a871e7f3 100644
--- a/Documentation/devicetree/bindings/arm/qcom.yaml
+++ b/Documentation/devicetree/bindings/arm/qcom.yaml
@@ -1139,6 +1139,7 @@ properties:
 
       - items:
           - enum:
+              - lg,timelm
               - qcom,qrb5165-rb5
               - qcom,sm8250-hdk
               - qcom,sm8250-mtp
-- 
2.39.5

