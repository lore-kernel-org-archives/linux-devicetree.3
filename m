Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.52
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795690657;
	b=i+ZwIA0M/r3EL/nHBIHplOMAel8df8LCjVCDwFYTfOVLF2o1R6Ih5PJCwTIFZJA72vZS
	 cYmeawVKgEiaz/GJaQZjSySZY7f37AfGxR5YcqNqSwCU22CD5qM0HDwQjaCI5zEId7eWl
	 KNuIHcj0pAAr9sykoFLvAAM83TxaoFBA4IbUssUtlg9YlY06eQIRO6EEKN3SKP7M3+1Lo
	 x0k+UcWtp2YHj5YMyIHPiq0bAhbQsiUoJgYXmVHdTgdXj33yv6QmNs8sdOZUVYkaS97Jb
	 b8z/u47QveE+FlFG/cjoyKMmXFsSOZ4JPHAkHituvCkFFvonPkSTLmjBhXDVStacJNg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795690657;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=v9V4lIhr1Yp8113iHXoe8ch5+6plW9DXOYXomuK6kQs=;
	b=oAW4NA2q0qWdhjw2+BAUZDnYVXeUnEZGninhHHXvtcpNbylFG5rFvhWaZE5rSyZlIryS
	 ygFqwlDwA1RYarEysuAQjqM+S/bSVVxcWRA3x+YWTVoVNHapEWfknbCveKtB97YFI9QAn
	 25vgHCDUwzVEBELRO1rZUOYIfYegJtiARSZza9s6BRI8dLPMJlvc4oG4SctYvyt8mJgls
	 zKxmakYxHI+c25KQcCuETfdqjwCMx4S2U2dxYVID7cc+/99qmrAVKKAGhf7OmjgHNRyxP
	 uU8p5NWxE6LtWEYU7F7ykNfFAjk+Z+pI6X1cnKdRLZknep9pJW7IK1YWmASlY+KKK/w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=tCfZGlcJ;
	arc=none smtp.remote-ip=209.85.221.52
Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2DE50606A333
	for <devicetree@vger.kernel.org>; Thu, 26 Nov 2026 10:57:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2DE50606A333
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=tCfZGlcJ
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-48dee593f18so6390437f8f.3
        for <devicetree@vger.kernel.org>; Thu, 26 Nov 2026 02:57:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795690655; x=1796295455; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=v9V4lIhr1Yp8113iHXoe8ch5+6plW9DXOYXomuK6kQs=;
        b=tCfZGlcJHZ/7qqklBwkZg5bpuriB36lcSzl2nc4fE+GOXVRxjiutOiLH2P2+T/uVLf
         hhNv3eLjOt5JUZzskhAj9vLsQVrMAE2zxKdLTeX4h5pVPe+W/fogIgDTqDRoLZps63/D
         kzdOQ3tqfqfcR2Aq3LqdRuqYDnMnsGAvRODEQ0g77T9whGIuqoOlUZ6h1JDlP5L+W2HZ
         7y8zOg2wNlPUO8RPHlw0tOf5RzJ8PtARDotmjtwMH0egsAE3nURr/G9xY+DOYlaPmsR6
         r86uPNXmEmPHNR0dKL2E421IfeaeFBO2+HRt3TNvYKJixjJXtJGRbY+QTEWcNQo+2cDL
         tx+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795690655; x=1796295455;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=v9V4lIhr1Yp8113iHXoe8ch5+6plW9DXOYXomuK6kQs=;
        b=QKIkOU/ahhk/CM+xy1k92sTMHIpbzctNutIBb0Gx4DYEUTPjW3LVoFqKotjKSZTWMn
         iJ16jxYjQAgMK4UZv9hDB5ozUM0IeqKCzkutHCWDbgunHxrottMEtGPf4VmUh/fGoxDM
         tXNiYT+rHtYlxjEQM2GowcAlQyjuTKoXQTFMHT+/b+kDhNJg94WudLbArSeTtcED5kSl
         Z89dDq62jLnPTJ56pV3cekyF5laEXcVVstl3DrRWTj6ThMhXZBKIYTGryl0/LqD/6yUA
         Mvdj1o076e7GehTn4BU5kFBMkD9pbIWtbFZLtKmDGVhrkYcv2GpgOjomlB7nodLZmTea
         vg6g==
X-Forwarded-Encrypted: i=1; AL+hErEvhVJ3O6WgNhBrT1YH5CZFJQL7Fi4maKs/CHVjKzLi1GOgKDCJkNMMvishak/hJonTN9BJLmVEcyud@vger.kernel.org
X-Gm-Message-State: APuU4Z9meT3VrmwdxCrYqs2vwyI4RwrJPpRcGh/CmfIceYcbZvCZiN9t
	XSC3/1jUWS9k+Y0O/0nSuTCbBKH9xaa31JSu4C/p2KwbMZwpeuPH8ZyrD9ZzAv5Xipc=
X-Gm-Gg: AZFdTZdulTK6INTUYH7+wyCctL5glejytal4Cp5hhX2aKtgF5uNfB0qZ3tRiftV8rSZ
	eWIj2SDTSxU+UuOaXkxva0zg91hAyCxENISPTL83QgL4MFjKPgj1fREU4RrEWFMO+vEeeeqJL9/
	JUsu9rBYqtF7Q0oq/LlSVc5oXalbRqB9+YHQhs/DKkOIzXz/MTsm8dHvZiHnPWRomByc/wqq3/G
	zR238Kb1+gnY7PHczEZsIhMbLOMgFtKqiax9hp8e/HE3Ti5LEVgETBp1r3xBqGIGWZDDqIBHDut
	hshVOhQcNoF8anvbD92leSpxsA4WyGaH9mMPxKJ4JMKOpABuWPDIa1oUYhmbTOGbRCtGmONiye0
	39Eatch0KQEU3f7ZW6HCxw9tDpolB1S9j4vz+ZhINY+67HiODSJaibYeLrhzvYZpsSu6VcjG2vK
	1dQuGgzOG8La4DW32Ghm43G3Z+ir3Q4DAzS65446gZ8tkIjJHlOqdv15/i2sO30+u6h2ocLS1/C
	yoabK3myD4YHgkqurTQWK2WgdQUXqlhK0ZQ3YPUfyFW7v8IHEsEMsAmtOSrW2ijPo0/dQrNbMnY
	Ar74mwvOXhbgPS01EPlz8Eq2DZtkQEu9K71C0/Eg2zAKhehpkWFWGJWZkU0YDWWu1BqqvjxDLf9
	hjLVa6XTgGKDpPZi4IKVzQiRRUYprQV6DhFtLdtQkx/LWHsw5Z0q1l4wT3xSmSyfXfcKpukTsT3
	UnOv085J3/TrkAG+RI1g==
X-Received: by 2002:a05:6000:29d5:b0:4a9:1649:9eb9 with SMTP id ffacd0b85a97d-4abb2168fcemr28263168f8f.16.1795690655498;
        Thu, 26 Nov 2026 02:57:35 -0800 (PST)
Received: from threadripper-fedora-workstation (d-zg1-148.globalnet.hr. [213.149.36.162])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab6b9add26sm40336850f8f.44.2026.11.26.02.57.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Nov 2026 02:57:35 -0800 (PST)
From: Robert Marko <robimarko@gmail.com>
To: andersson@kernel.org,
	konradybcio@kernel.org,
	abelvesa@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	agross@kernel.org,
	linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org
Cc: Robert Marko <robimarko@gmail.com>
Subject: [PATCH 3/3] arm64: dts: qcom: ipq8074: add WCSS SMP2P node
Date: Thu, 26 Nov 2026 11:56:52 +0100
Message-ID: <20261126105722.188103-3-robimarko@gmail.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261126105722.188103-1-robimarko@gmail.com>
References: <20261126105722.188103-1-robimarko@gmail.com>
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

Describe the SMP2P link between the application processor and WCSS.
Provide the inbound interrupt channel and outbound state channel
needed by the secure WCSS remote processor.

WCSS also needs an outbound kick after its inbound entry returns to
zero during a restart. Enable the restart-kick property for this link.

Signed-off-by: Robert Marko <robimarko@gmail.com>
---
 arch/arm64/boot/dts/qcom/ipq8074.dtsi | 21 +++++++++++++++++++++
 1 file changed, 21 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/ipq8074.dtsi b/arch/arm64/boot/dts/qcom/ipq8074.dtsi
index 1d1c9aab5fdb..7842a2bc4175 100644
--- a/arch/arm64/boot/dts/qcom/ipq8074.dtsi
+++ b/arch/arm64/boot/dts/qcom/ipq8074.dtsi
@@ -142,6 +142,27 @@ scm {
 		};
 	};
 
+	shared-memory {
+		compatible = "qcom,smp2p";
+		interrupts = <GIC_SPI 322 IRQ_TYPE_EDGE_RISING>;
+		mboxes = <&apcs_glb 9>;
+		qcom,local-pid = <0>;
+		qcom,remote-pid = <1>;
+		qcom,smem = <435>, <428>;
+		qcom,wcss-restart-kick;
+
+		wcss_smp2p_out: master-kernel {
+			qcom,entry-name = "master-kernel";
+			#qcom,smem-state-cells = <1>;
+		};
+
+		wcss_smp2p_in: slave-kernel {
+			interrupt-controller;
+			#interrupt-cells = <2>;
+			qcom,entry-name = "slave-kernel";
+		};
+	};
+
 	soc: soc@0 {
 		#address-cells = <1>;
 		#size-cells = <1>;
-- 
2.56.1

