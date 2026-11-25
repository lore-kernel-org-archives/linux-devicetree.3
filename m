Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.52
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795577289;
	b=Ql7fGqHkrTYTAL4drTjAHyjtRmbb/iZoa3IMtdM2ykGkr+b6QZlx3tezQtvllC2KQAre
	 EAMP0KJ+rdnd8aLelZF9dO76+RaxBMyAVNGhULydAja/ZQtK4VMtYOfgNZWWiklL7fsew
	 +ZDbHQVtHVn+zOQ6HdKnda6mE/m6XpHa8xAnbmIUFJuTdCSoTOQywRgZ8bDMyM9iM2rTp
	 7ppkYiA06SpnC5Nq3OZUZ59vuqqNQbjrOne7HTWyYA8B1y/xUO7zaMSg345uX8+eMAgq0
	 fOqfgNUodHU945arco+11pD97zoYZ7kgOD6D41ssJO9OEalcEbHjXsPONufjn3qvVdQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795577289;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-Id:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=Lq5GK581V8x7ovO5oAhOTbEGADqrrK51A5iNkY/jsEw=;
	b=jU8hwkezjfB5UugQbxagIT7ixJ2bw0Wap6oDepfsfcvCDNHvWBzUast8fskKBTTtcU1B
	 2fHO1BV6GDXkjRda+IBv2MTzwX4PxtR1MURc2a/3XpCR54Wl0hEr+YXSxrVCzIsfyoYge
	 VjSRXmSWY8GhpVvJtr4cVp7Uzw13TmAxYWcEcOOC/TwZNihLh0R5DYri81aGizj508iCa
	 PywxyEoy34uyvVwA/GiSiN938vnj/LQE9h5+F1lCebahjgH6/xQWBpFcM9wOgOkRBtH3f
	 lx2IqKoezbPt/Foq+yaWtqgJgepE1T3whahN7pXm/D45G7PhDZBf+1K8tIkWjymSfpg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=GAkKmFZe;
	arc=none smtp.remote-ip=209.85.221.52
Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 247B7606A323
	for <devicetree@vger.kernel.org>; Wed, 25 Nov 2026 03:28:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 247B7606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=GAkKmFZe
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-48e47347279so3118828f8f.1
        for <devicetree@vger.kernel.org>; Tue, 24 Nov 2026 19:28:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795577287; x=1796182087; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Lq5GK581V8x7ovO5oAhOTbEGADqrrK51A5iNkY/jsEw=;
        b=GAkKmFZeYJdeyxoFnkh9isZrU3i6UCbsZOVdLwfB4v2LQF1h8z+4rk+iqz59bQ64dn
         8zTxsCXgxfGgbE6Bwa6Y7qsBmv+4Dxzq8/S70qdc0R9PZ0Y2uaKHghNAaCKEOExHZJiU
         POquc91sPAnlzVRSxYnsxLtXJobZNE2Fh02SJSPUWOozFb+nfxqG1QU9tdbVbhxm5Uxw
         mLqebyiqt6urRpwsv1zLryw1YaoCw4UmB2EZVv+JOO1xupHyEOnxQ/kJpbBGb27Z31Fd
         TOHDGZpnaCOvqS3bf9g7fpTTOeuvmsjLnmLXGqVHyBSXvon0XYkCUiyGwjjRuScaP8op
         infA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795577287; x=1796182087;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Lq5GK581V8x7ovO5oAhOTbEGADqrrK51A5iNkY/jsEw=;
        b=SXqKjZyb/bW7bDbAo0LiscZhdmZQmpyFJG2VXaVmWNmIz+LbqPTDmC7FPwiK2Tdk1T
         fmGn4tiGdYnClwWik4wQONiLLSxzA/aVvkF2iMeZvwTNxinkzL3LBXjiemZzNG5P4N41
         f9RZkGnXUNwOAO5cEDSVG8a4SqklMkqLgcCS3jmYEfZXNOAlvDsk7kOuHSOLO/M64Pz9
         99V/loftLqh3t1k5pXCYNa4Qdb0E8uS83SppndPyjD5HDB7GIaeO0r6YFxJkofpj6AJ/
         SiKM86rAsnjHEmFLazjS7+eq6eC5t7aPR1alT2HwAROlChedcNOc+cPNWNgqEx2iMmcY
         18fw==
X-Gm-Message-State: APuU4Z/HOtx8sySEP+kjMOe4aGCOOIvsFnH2bh5Eazygsu6gZjbw9Kiy
	KGCMTD4iOBCDxCazfcDgvwYE2xsR7r/UtnG6NTHEgl4qGZlOb1nKT5iC
X-Gm-Gg: AZFdTZcgAp8WEnLzA9a+bWJ0JV/7BdtS1cS8rQe7qkX3auzfccI+JTiuMH1ueBaBVXB
	lkOlO7wFZBk7mfCm+ScYya0TvA6TC9q8oFvss3i4NU/4wsy1ptOv2GWP+j6Ox3+gOcUfsWR97pH
	DfKE1IB4Kn+p/FKzzsqqKeIHBBSCrsgmapF4ThXO5vYPB2o8fUcJnFjMM0OVyF71UfNNwOxTnnJ
	zUQXHtyeneINGWbBa8k5voKPkQKxlGb7ekMQT+fwLKda6MS+qp23Qb06s7mI4ewc/C/ktZ4sMJ8
	Cgg4Rc+dmXDdvCLcV/WCmdudmZjVs2QH7DMwyNhaYHRGGWQINu5K7BpOFLSzdtpgKexEaFJNxqz
	4BdLnME8toz7/SvJAo/uzOAIXeCQtRu0lP1B0rbBMlRLY0G4H5h+1HRAde0hXzGE0jJbOKpLQMn
	GbC4orauF6SM6Xx4a0dXoBvwgqYV689dj/Sc896Nit0mISSdOVEIb9jedYt7qrVwP7GskwpFPKo
	bnp4L2aTAWzb3MK5K6TedstMkY881BZ1sYi+JiVOTVCsOVPI/RcOjiM/hziNwtVHwOzbix/cpw6
	jwqIhsK7chSTkpl6tNwSNGe1glXeYuIczy6stlu6M5bgNdqbO9pmtyLR4JIIeFRJhgyG77hlkN+
	54PLlNlo53slqt2NGAvL1ig/1d1/O3cE=
X-Received: by 2002:a05:6000:26d0:b0:4a6:8012:197 with SMTP id ffacd0b85a97d-4ad5d5f9320mr30278129f8f.2.1795577287400;
        Tue, 24 Nov 2026 19:28:07 -0800 (PST)
Received: from DESKTOP-BJ3EVC4.lan (178-164-182-185.pool.digikabel.hu. [178.164.182.185])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab6a67fe48sm28918822f8f.23.2026.11.24.19.28.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Nov 2026 19:28:06 -0800 (PST)
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
	Abdur Rofik <rofikcoga@gmail.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: [PATCH v6 1/6] dt-bindings: arm: qcom: add LG V60 ThinQ 5G (timelm)
Date: Wed, 25 Nov 2026 04:27:57 +0100
Message-Id: <20261125032802.8460-2-rofikcoga@gmail.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20261125032802.8460-1-rofikcoga@gmail.com>
References: <20261125032802.8460-1-rofikcoga@gmail.com>
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
Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
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

