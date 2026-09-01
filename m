Received: from mail-ej1-f46.google.com (mail-ej1-f46.google.com [209.85.218.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DD4634756D2
	for <devicetree@vger.kernel.org>; Tue,  1 Sep 2026 08:59:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788253146; cv=none; b=UG5VO/wZVG4ZJ99qSp8tiEKfFcQro4bcBAej8S4V/LtJ9GpTu+hGptgHBRUgyHJrAnbFzpNqjl7Sja+QBFzDXRiKj1gVk8eBCaxYz8og7bSS5ZFP0Gx0mDykTbl1lllKRC1rCA3WY6CLB3JqD2J9liSrokFhs2HxlEEPZfLYJJc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788253146; c=relaxed/simple;
	bh=gtRV6Ewke43YWoD7VGaNfgttgen5p0Izbi4DKRlrJlQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=VSUqa2AIpMTAgeYpTmVCRg6CuTyfXwf7BI2jo4/jUOWDi9+DflHKODkUo1usysLBHZ1pZrIOeMOML6rPxsDbcghLmKT4K1lks46Fj4ahOJYeB88/zMfe0GHGaiNWiYsFs6Mf2t4PQ/lp8f2+9SmuDY+QQn7Cta7wNj7XGU6AntU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fairphone.com; spf=pass smtp.mailfrom=fairphone.com; dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b=Uerwpnfe; arc=none smtp.client-ip=209.85.218.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fairphone.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fairphone.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b="Uerwpnfe"
Received: by mail-ej1-f46.google.com with SMTP id a640c23a62f3a-c1c26d7e951so775511866b.0
        for <devicetree@vger.kernel.org>; Tue, 01 Sep 2026 01:59:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1788253143; x=1788857943; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=myNLA1zehJ9sNi0f8euedNSkhaiWUYmsY/g28jpA0NQ=;
        b=Uerwpnfe0YtAHFqu0fEgO19FcC3HQH7V+smK9iV8U1IkjlhnJiRtIvYYJKkpimm56C
         KC7njpMdkKSJtio5obECYIA+p+NdTalx1AGgWxxtg3v1tE7Pi5no4GhQnf4sn//yeqA8
         eh0AGdgErpC6FSE1lqQLa8+NQj91y8dlj3Sx9MrmB2OXKw413JrW1UrO1phnXBfUCbmE
         PxXsiar2g86MZ1DUJkdfdcaJONwUoVDNUv5+Jch5ZfkaK+KGFQTmG9qLxfcEH79rWe3E
         S6PHJqR/5eGBZXgJN/1VTkvrg1z/f7RBdcfvH/r0pDtAdUs5COE8XqhNpEBCI7oWlsvU
         rPQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788253143; x=1788857943;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=myNLA1zehJ9sNi0f8euedNSkhaiWUYmsY/g28jpA0NQ=;
        b=oZlMUfvjyXjG/ZUn2MKQmFhlGDPR8MtGCB5+x82nM7pJK+CNUgQxiOdtlMnGQyXPcM
         sguQFv4UsvKXUTru1M8ao/MjVFfNNYqHkqoH9niBT4NrAnSOwicSu9JLmW3PyLQ/0YTX
         yZrLwuF5LXkfqVE0eNHIZPfUYxkVKaxWg0GKG5VcwigGcvbkC6s9bM9lDEd5i0aFXC1I
         6Xz4MGEaHW9MCNHeswaVtmrtL0heDdFRJqOSpeDetMCW6eCzwWHEeokTIXFgcUSoBoOD
         rpZPHJun/kRadR6Ud9AE2Vjop+BOe3bI4bYOsf7yo0ixJjGpZP3w6B+YltqcfKhB39BD
         ABgw==
X-Forwarded-Encrypted: i=1; AHgh+RoVciSjaLZUwBWMmS+BzwopXQa3maEDWNnjuVLqJJgcpDXAilPqO+5M6k749tYsUNFHqDtkdrR4QX80@vger.kernel.org
X-Gm-Message-State: AFuF++k2at08kxDslg6m4ojlKRpbZfrQ5coxBjVzkMzfglfsUPjwxFhM
	dKvTg3yca0p8L/bhW+6kUWUIFylIxIvg1e1Q1c1CjGjEphBXazxWV8zAL+VVyOoAbcE=
X-Gm-Gg: AYBFou0KqUbp66z1ElxYmJ7B/5EH6CxwipG3+McDCBOVkhsPkPyMz82IpxlMSYd4RAm
	hvL91PetKktcu+LjClVvYk7KHVZsatICzj410hRBoSbdAVZ08TFzekp5OjTCdGf8enQmzlbdgln
	+b8Ug7p25Cs1jZ3loMYtTe7rX6PbEBbeuvVLxE77/5rzljvNWNottg/Y+t7etbXzbzWCR9HzEem
	NnXA57l73sfGXqnLGLKjRRHNGgYSk7dQZ+gSrYpoVCzgwrujXAYl9M3Y8Gnt9c70G4NB4XtFyUz
	/kZclWbjY6pjdObGv0tOLJm9reaZb0eTpKtWLwMZLcDOcQGXK3iPOq4AK4yusWGy7O96xBjXz4L
	KhkCrI5eZgKM45sCAeFhu/IA5+tGSvITCZjKEfv/mEkyK/DgKHnsvLWrg7wj28BDfEdibqH+hB7
	GqvvLpB9myoKLqTNRQYccx1gsJ2+mMOMSbIMV8Vf22pqpANJ8eA+sRHlGmpdA+CeRjWW17eDuct
	HCbtzV2Zj3U2yUkd+wgMEilwErk1MK87+OqNYpNWa8WkA6B6RuTEA==
X-Received: by 2002:a17:906:1005:10b0:c21:4393:c41a with SMTP id a640c23a62f3a-c25b3c9a988mr335100766b.11.1788253142843;
        Tue, 01 Sep 2026 01:59:02 -0700 (PDT)
Received: from [172.16.220.101] (144-178-202-138.static.ef-service.nl. [144.178.202.138])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c2564e314a1sm511942566b.42.2026.09.01.01.59.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Sep 2026 01:59:02 -0700 (PDT)
From: Luca Weiss <luca.weiss@fairphone.com>
Date: Tue, 01 Sep 2026 10:58:58 +0200
Subject: [PATCH 3/4] regulator: qcom-rpmh: Add missing regulators in PM6350
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260901-fp4-regulator-supply-v1-3-68288ab70aee@fairphone.com>
References: <20260901-fp4-regulator-supply-v1-0-68288ab70aee@fairphone.com>
In-Reply-To: <20260901-fp4-regulator-supply-v1-0-68288ab70aee@fairphone.com>
To: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>
Cc: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org, 
 Krzysztof Kozlowski <krzk@kernel.org>, linux-arm-msm@vger.kernel.org, 
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
 Luca Weiss <luca.weiss@fairphone.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1788253139; l=1979;
 i=luca.weiss@fairphone.com; s=20250611; h=from:subject:message-id;
 bh=gtRV6Ewke43YWoD7VGaNfgttgen5p0Izbi4DKRlrJlQ=;
 b=wTcjvPwxFnWd3nmkZRvV9d8daVlU48WfygpIRhMf845BuJBjV9RspxVJnrVwo6g5N4EdjTlGD
 05uVoGUWRcuCCD5BZKIPRjjPbWFAA/0jMQgWoGa8wIFyBOKpBnkxDT9
X-Developer-Key: i=luca.weiss@fairphone.com; a=ed25519;
 pk=O1aw+AAust5lEmgrNJ1Bs7PTY0fEsJm+mdkjExA69q8=

Add the missing smps3-6 and ldo17 definitions. While smps3/5 and ldo17
are not used from the rpmh regulator driver on SM6350, the regulators do
exist, so add them with the types based on the datasheet.

Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
---
 drivers/regulator/qcom-rpmh-regulator.c | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/drivers/regulator/qcom-rpmh-regulator.c b/drivers/regulator/qcom-rpmh-regulator.c
index dd2265961151..7d20f3e47760 100644
--- a/drivers/regulator/qcom-rpmh-regulator.c
+++ b/drivers/regulator/qcom-rpmh-regulator.c
@@ -1591,7 +1591,10 @@ static const struct rpmh_vreg_init_data pm6150l_vreg_data[] = {
 static const struct rpmh_vreg_init_data pm6350_vreg_data[] = {
 	RPMH_VREG("smps1",  SMPS, 1,  &pmic5_ftsmps510, "vdd-s1"),
 	RPMH_VREG("smps2",  SMPS, 2,  &pmic5_hfsmps510, "vdd-s2"),
-	/* smps3 - smps5 not configured */
+	RPMH_VREG("smps3",  SMPS, 3,  &pmic5_ftsmps510, "vdd-s3"),
+	RPMH_VREG("smps4",  SMPS, 4,  &pmic5_ftsmps510, "vdd-s4"),
+	RPMH_VREG("smps5",  SMPS, 5,  &pmic5_ftsmps510, "vdd-s5"),
+	RPMH_VREG("smps6",  SMPS, 6,  &pmic5_hfsmps510, "vdd-s6"),
 	RPMH_VREG("ldo1",   LDO,  1,  &pmic5_nldo,      "vdd-l1"),
 	RPMH_VREG("ldo2",   LDO,  2,  &pmic5_pldo,      "vdd-l2-l5-l7"),
 	RPMH_VREG("ldo3",   LDO,  3,  &pmic5_pldo,      "vdd-l3-l6-l8-l9-l10"),
@@ -1608,7 +1611,7 @@ static const struct rpmh_vreg_init_data pm6350_vreg_data[] = {
 	RPMH_VREG("ldo14",  LDO,  14, &pmic5_pldo,      "vdd-l12-l14"),
 	RPMH_VREG("ldo15",  LDO,  15, &pmic5_nldo,      "vdd-l15-l19-l22"),
 	RPMH_VREG("ldo16",  LDO,  16, &pmic5_nldo,      "vdd-l16"),
-	/* ldo17 not configured */
+	RPMH_VREG("ldo17",  LDO,  17, &pmic5_nldo,      "vdd-l17"),
 	RPMH_VREG("ldo18",  LDO,  18, &pmic5_nldo,      "vdd-l18-l20-l21"),
 	RPMH_VREG("ldo19",  LDO,  19, &pmic5_nldo,      "vdd-l15-l19-l22"),
 	RPMH_VREG("ldo20",  LDO,  20, &pmic5_nldo,      "vdd-l18-l20-l21"),

-- 
2.55.0

