Received: from mail-ed2-f12.google.com (mail-ed2-f12.google.com [74.125.228.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A96BD435AAF
	for <devicetree@vger.kernel.org>; Mon, 14 Sep 2026 10:26:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789381571; cv=none; b=SJemNm+0UMPatvXhFeCOYIQMXGFiL3o865h2avSycdEXklM2gfpjsHWkCbF45hxDAEuYLThdzMLSg4k5mNMKQMsef7H3EQEw5kRc2Xtqy4B1SV0MgOVaQsS/SIs4u1ZZpQt+3OhdBFgWWLf9OW9blCVni5xiAiPmdQ+Uy70EBic=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789381571; c=relaxed/simple;
	bh=JTnC7evvvSVnCXtJTc4smePwvrp7zkcqWy6xw6xapD4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=nxVHzTZ2+NdUzoB/5OLm8CHMZecd/Ci0lZxaO2kVZaKlwrLpVDbDi0ToBS8MmeLHWVe83fVXjueE+ewbJmMzvGUct49kJgNbUttz9RzgUpOb9w8RSYZB6n1vcaCO1ASsw3x+FWy7hy08bh7MIiWa0gqKxjlsSV1yxrTVkhxprVQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fairphone.com; spf=pass smtp.mailfrom=fairphone.com; dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b=nwVcHXtZ; arc=none smtp.client-ip=74.125.228.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fairphone.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fairphone.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b="nwVcHXtZ"
Received: by mail-ed2-f12.google.com with SMTP id 4fb4d7f45d1cf-6a67fa7a64eso3332634a12.1
        for <devicetree@vger.kernel.org>; Mon, 14 Sep 2026 03:26:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1789381567; x=1789986367; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=m/xjkeNfa3orUpMBTgLWbWZfnOZ+F/SCd2qFtqtxeTs=;
        b=nwVcHXtZxtDXe72sBxVwCcyzRywU2DyQ02ZKTKJBNK8e0Q3gIALRZc+DD+Gi7JhuHE
         U5zX1vTTiTwdEaCUPf0KKf3oiftrr8mqL//DZ0Bzu8E9Us46TcXbkxvWuJgRjxfh7hNL
         dB7H5cvtOPxE6QM4o+KCA+vxw5w/P5todRRLH1b7zQQr9JJSvJ3tI41Q0V8RMpKzG5w6
         5+W8qXcew1XZq+0WhwhfUIwIN/7RHTSGstQTeuWFW/RUr8hMG7v7bApdBfQ3QmKPPLts
         aNG+7BltkEkkN9Pzmg1S/2NnT8IxWp3q03hg88rjcx+lL+2+DjrUoZmBTid54WTFkAA9
         P4zw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789381567; x=1789986367;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=m/xjkeNfa3orUpMBTgLWbWZfnOZ+F/SCd2qFtqtxeTs=;
        b=DHRfnc/V9r5hoBd3KxULJwPbBXQDaL96KqPvG1kfjnwm0GzwgIXwaCi4582oLgw3Nb
         tx4/j6NB1LQRtYp867nybHFhfAhfbuesJnxPzLq9oe6rPRUOz5MmcCo9/O9DtFISfxUG
         5JwFIVpftziCSgrcZS57vnemvY6ODTGD0mPnsH/I85woywUP5RvPU0vwLS0uQ5YhtZI4
         Jz1EpoIRKWvqOsekTZZtNCEKRIKZsoXVFc4pvjkhD9fLYEs/GWGettR97nZMnrE/6T/0
         U20LReehz27J1WBME+2cCByDbX0Rz8RAdGvY75lcvPFpPlFreh7aV4Du4LA57qE6XO0J
         KOyQ==
X-Forwarded-Encrypted: i=1; AKwUvBwcgrTHjfgSTcevQQ+gWw+4E7n8PpMlDKGUemCyN/VSMFqHIOEK/CU+OIU/MiprXLgNqOEFl8xo61zt@vger.kernel.org
X-Gm-Message-State: AFuF++maeUsriZqrQhEMea0nX/v5Ibz6Ev7v0Wg4kFAI4z/rx7IQxd5G
	sL7QOsoDG39pxX3lFoBSL4By0OUDgbJVrmKTIIeuw81g1bIt4prpQYei3RZEBHDO9/U=
X-Gm-Gg: AYBFou1plMrNXdhbHBQ3kvY06jqqvoz35xwgSYwxXNTITD1Ig0u4WKtITgl4eyrW8Xi
	LKnfl8UoJUGJaMN1yfnFemRYpo9GVuuex0sKB0zdzR/yAr3jat2eVjZBuu2DnzgS1zoJ5t0qKBx
	SIfVpT/RSYnAXvwakD7tze/rzgu483A2oJDFyhVGjbR70AlXOPgHIH1tPGkeKoEtC3BFEAfaV54
	TUidYiZwkvVDutsA5IBMlRBJdm8lMkjfrJkoXjtk//1oKX00GVx3AeDL5bz2mDwuEgwC6Cs5l0j
	sVmbTXcBBtWZIf+0DRymm7LEqG0Ox6zZTvze7ze74bQ5Tj0d4edM13mlc+8NmUKMqimj/QaJtUJ
	x/0w9z9UyIKn9eRERsJqs8TQu9ljEkPdMNxapayF5zHXHY8hFB8gGVjMfh44U93c3nLvC08F3wT
	2k7twqKogBWuBTrRd9dxdJypbdpuLbAZBklPcT1QqOTlzi4cveQqZPOs8ab1BhU4D1odFTNDcEB
	CHk/CalHO6MUt5z0JW88dOR5zh2vlINYfxb0ci/EMjhvBJ10TOXd0bF7HR7G3c0dWBdkg==
X-Received: by 2002:a17:907:9409:b0:c26:1648:a067 with SMTP id a640c23a62f3a-c29b874c69amr127928166b.34.1789381566684;
        Mon, 14 Sep 2026 03:26:06 -0700 (PDT)
Received: from [172.16.220.224] (144-178-202-138.static.ef-service.nl. [144.178.202.138])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c29660654f2sm399985666b.28.2026.09.14.03.26.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Sep 2026 03:26:06 -0700 (PDT)
From: Griffin Kroah-Hartman <griffin.kroah@fairphone.com>
Date: Mon, 14 Sep 2026 12:25:58 +0200
Subject: [PATCH v2 3/3] arm64: dts: qcom: qcm6490-fairphone-fp5: Fix
 DW9800K support
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260914-b4-dw9800k_cleanup-v2-3-6553273aaa33@fairphone.com>
References: <20260914-b4-dw9800k_cleanup-v2-0-6553273aaa33@fairphone.com>
In-Reply-To: <20260914-b4-dw9800k_cleanup-v2-0-6553273aaa33@fairphone.com>
To: Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 =?utf-8?q?Andr=C3=A9_Apitzsch?= <git@apitzsch.eu>, 
 Luca Weiss <luca.weiss@fairphone.com>, 
 Daniel Scally <dan.scally@ideasonboard.com>, 
 Sakari Ailus <sakari.ailus@linux.intel.com>, 
 Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-media@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 Griffin Kroah-Hartman <griffin.kroah@fairphone.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1789381558; l=1259;
 i=griffin.kroah@fairphone.com; s=20250804; h=from:subject:message-id;
 bh=JTnC7evvvSVnCXtJTc4smePwvrp7zkcqWy6xw6xapD4=;
 b=UixvnkrGXEGNRyEsuLdRQS6wYyb87osS85TdzSWmu33H/b68rRJUlvsvPGSO1HZz69yXJVTS7
 e+qKPeMpv1EAVkjnn2ilPzp7CTjdrwic7uMxC3wLjPSWlV20kFyB3MA
X-Developer-Key: i=griffin.kroah@fairphone.com; a=ed25519;
 pk=drSBvqKFiR+xucmLWONHSq/wGrW+YvcVtBXFYnYzn8U=

Update the node for the DW9800K for correctness.

Now we correctly select SAC3 mode and enable timing-control with the newly
updated device tree bindings.

This is a breaking change for a part that was previously functioning,
but only due to manual register writes in the driver. Now that we have
the correct documentation we are able to update everything to ensure
functionality with other devices using this part.

Signed-off-by: Griffin Kroah-Hartman <griffin.kroah@fairphone.com>
---
 arch/arm64/boot/dts/qcom/qcm6490-fairphone-fp5.dts | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/qcm6490-fairphone-fp5.dts b/arch/arm64/boot/dts/qcom/qcm6490-fairphone-fp5.dts
index fa4566df0a711fa0a08cc71fef3b7a4e1a0d2a4b..cc99590afe3a62a2aee3410844ca0815c8f43558 100644
--- a/arch/arm64/boot/dts/qcom/qcm6490-fairphone-fp5.dts
+++ b/arch/arm64/boot/dts/qcom/qcm6490-fairphone-fp5.dts
@@ -744,8 +744,9 @@ camera_imx858_dw9800k: actuator@e {
 		reg = <0x0e>;
 		vdd-supply = <&vreg_afvdd_2p8>;
 
-		dongwoon,sac-mode = <1>;
-		dongwoon,vcm-prescale = <16>;
+		dongwoon,sac-mode = <3>;
+		dongwoon,clock-presc = <0>;
+		dongwoon,timing-control = <16>;
 	};
 
 	camera@29 {

-- 
2.43.0

