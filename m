Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A9E663F44F4
	for <devicetree@vger.kernel.org>; Mon, 18 May 2026 11:16:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779103002; cv=none; b=TT3r1wIZmsvvToAY0uhelmeX5ULK+PBtjIKju6/Ovz/a5d5VT/xQValtAjQGepr5JAjdYkeTFMMP47UMXsOu/N3uezRv2fU9fp723qw3bQDzXpf2uWA7Al/4FBv2snCsTUVPgzug2b1vA5N5Rl3KASxD1xeWpixUizx4cPVEjZc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779103002; c=relaxed/simple;
	bh=MWg/nLWkhyUVa0mtN8ECSXnZ9iF3BnMHKiVrK+2x1s4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=oGx/hjx5BjDM9yb+NwtRz1TnOfqOjJxLjv50A9oD9WKYRS7rSD1Sy0mr9fYUI6ufnBoxp6IBpu0dp3tQHyIFk//EKgI+knvi8sBAqWWoZFOS2LQ4/qvIX/JpLL+JivyxofJQlsi/xBPmZPbGbeWqPn1xuz1NkjIBa6MJTBwN20I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=JBY+pvsT; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=J/2Ns37S; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="JBY+pvsT";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="J/2Ns37S"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64I7YQEI1803985
	for <devicetree@vger.kernel.org>; Mon, 18 May 2026 11:16:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=ypXJeOo1Vsw3XPBod+p9NB
	io0CYVmgBXGsE+ri86JNw=; b=JBY+pvsTz3GcvNUzJcVIG3a0A/Mn9kI9NmloQY
	aL45Xczkaz8IWgFY/xD9U+a+Rtd1896f+Ypb+/da5bgvC5N0gwYRIafpDNCbueYJ
	bWEI7AvbplKTOkqLvc88ZsHf3MfW1KMJHIkgpMyStGzv/aarBzWzBXFimpaLkbXc
	U1JwVkS818F1MvFOqlrxLuE2EJPZb64mt7GVc1+8im4rXnmoxD/hThTrKMFRWaAG
	dyDvFd78p6RBTBCw+QVkY+pT0JV6iSrW6Z81Fn6Ndw/FgCcv1sdTQ4y3kUBPATTN
	aMqm47lzlXHkC2aaLS0ap4Sb/xjEn3asW26yaRb99LvZ94Nw==
Received: from mail-dy1-f197.google.com (mail-dy1-f197.google.com [74.125.82.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e6gx6x6cd-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 18 May 2026 11:16:23 +0000 (GMT)
Received: by mail-dy1-f197.google.com with SMTP id 5a478bee46e88-2f2d983d109so7694518eec.0
        for <devicetree@vger.kernel.org>; Mon, 18 May 2026 04:16:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779102983; x=1779707783; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=ypXJeOo1Vsw3XPBod+p9NBio0CYVmgBXGsE+ri86JNw=;
        b=J/2Ns37STHfi6Uem0Xt5+FQ6JDb7OCtzkP8zK8riDsJbzDry3yYEXfNh+4wmK2F0Hd
         4VJTWmkK863dDt7oikzwoRC05Y83cDLbvbDLHrYlTuNvwlzbxs/dlwx99Q2psglb+aeS
         xaYlYKusMPps6mq92gi3jhs8QoYUi+6PpJ8Dd582iTBX33aByOD7vgPOJPEBE0bteysk
         h5RBPZoTekeycXNlavYz+VgmjQJWd1l5apgWEkZoLGvs33jfwyRtPfLAuVnK/xQd8AK0
         p2VPkGQPKkXFgrlVhboyNZrCfcY8a7x09KM/C9oP8vw8RPjbjRr3RlOcVhLbih2wpHVK
         fNEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779102983; x=1779707783;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ypXJeOo1Vsw3XPBod+p9NBio0CYVmgBXGsE+ri86JNw=;
        b=Yfccmpbi/ik2WsIfbfPOSUqiuswLGFYGLTQ3MIwtpI3fTHpmsmKLE5pfd4Fc14xcto
         pkTI8jRz4uxlkbt3lb5SjB7aXW8hffWhQ+Rg+hpgADe4jHqnroMlYOs4YPb0lzOk2cga
         Hjqo617N2ppoifsH6HsGjuNPJTINn7VOJBSj7KgOfRkFr3ClW7OW3Yt0Co0V5ffTc84V
         W7oyB6kpe6x3GCk/3AoQeP39iGmII7hjGOPHgcvo2NhMcyMencmfpSrBLTSrxUswSvtr
         SMci5aGPthRp2sDW2AhsIth5Ogc/efwWoGmNoPsmZ8SRx6jNV7r8hYijDKzaX6Lxkbhe
         e++w==
X-Forwarded-Encrypted: i=1; AFNElJ+CO++MK9X6/LHSw8kwe/dmrnWZAqiKxT8I6rwxN3qs0QaT7ZiDVBNuBquZU3BhO47U1qAFdWAddJaL@vger.kernel.org
X-Gm-Message-State: AOJu0Yx9bItXnXaCbemtrEpEJ1gl8XIaSya4aaZKkKGfrIlaUY7RswLI
	AU+0SJQRuf31EvPk4UmHO+OeS3jfuWbtFS6yJUYLitKNmBTpqQS2GVonm5XPXGtDokLIsGw3cfF
	pnWMGMt4/7gUFiZSHHshUyCgZOdw2A+4rxNmpgN8s3S13Wbp9Z+w7uWGCbLfDUoRxQ1aaktwvnw
	E=
X-Gm-Gg: Acq92OGJMzWyoqO48oQwqT/k14Hg/X1jsP/pDT9y2pCaF5twnbkl3hiyt3z0vLHvsBd
	0007vgAKqNXFjjRNfeABPoH9mDsPDzRjpqntxBhwTu0hEIsGZVVeEW0zKz/ptG7FDh/ultoHUfV
	3fTXjdqSD6Jn6y66H4aeoXdu9dCgDw5Rbhzp2UVdLMpwV7ffDKTdBXNIbs/6NKZ+QApJAqgUOKD
	yS+s6luSsXcoy0prSm/q6KFGYYedHKP0z7QIUdhyd/lXNvjn/AhXyDzkir9tcMJ499anlz+QwIS
	Ea1Jkvk7I4FqjZ+INrB/hsjW65gMvjgPIqLLZgVRph38uUmYMA6UgzTiT1ZBlpETyvaNLNTlMIb
	hsndf3DqAerRsop5C3pmIHd8eRpVrTb4og9Inuno06IA3OcYT5n4aPFbwXKFZ79wIETOSF9Kuv1
	/2+7LgBhNAPw==
X-Received: by 2002:a05:7300:3722:b0:2c7:287:6740 with SMTP id 5a478bee46e88-30398659f10mr7363914eec.28.1779102983101;
        Mon, 18 May 2026 04:16:23 -0700 (PDT)
X-Received: by 2002:a05:7300:3722:b0:2c7:287:6740 with SMTP id 5a478bee46e88-30398659f10mr7363891eec.28.1779102982478;
        Mon, 18 May 2026 04:16:22 -0700 (PDT)
Received: from hu-ggarmidi-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-30294500a97sm15446058eec.9.2026.05.18.04.16.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 18 May 2026 04:16:22 -0700 (PDT)
From: Gopikrishna Garmidi <gopikrishna.garmidi@oss.qualcomm.com>
Date: Mon, 18 May 2026 04:16:17 -0700
Subject: [PATCH] arm64: dts: qcom: glymur: Fix unit-address mismatch for
 spmi_bus2
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260518-glymur-fix-spmi-bus2-unit-addr-v1-1-27d6edca51e8@oss.qualcomm.com>
X-B4-Tracking: v=1; b=H4sIAAD1CmoC/x2NQQqDMBAAvyJ77kISUIJfKT2kyaoLmobdRlrEv
 xs8DgwzBygJk8LYHSC0s/InN7CPDuIS8kzIqTE44wbTW4/z+t+q4MQ/1LIxvqs6rJm/GFIS9L2
 xPhobfRygRYpQU+/B83WeFxHu8rFwAAAA
X-Change-ID: 20260518-glymur-fix-spmi-bus2-unit-addr-85018c01c8c6
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Maulik Shah <maulik.shah@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Pankaj Patil <pankaj.patil@oss.qualcomm.com>,
        Jyothi Kumar Seerapu <jyothi.seerapu@oss.qualcomm.com>
Cc: Jishnu Prakash <jishnu.prakash@oss.qualcomm.com>,
        Sibi Sankar <sibi.sankar@oss.qualcomm.com>,
        Raviteja Laggyshetty <raviteja.laggyshetty@oss.qualcomm.com>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Gopikrishna Garmidi <gopikrishna.garmidi@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1779102981; l=1131;
 i=gopikrishna.garmidi@oss.qualcomm.com; s=20260102;
 h=from:subject:message-id; bh=MWg/nLWkhyUVa0mtN8ECSXnZ9iF3BnMHKiVrK+2x1s4=;
 b=0ynt2AeRB97WrLpwY+h4mSnykOI4nJ7fWuvp7lcBo/SyuUahv78ddWhn9J8eeH82yOXWA9vWn
 zXPsek0n57vBqbAW5YQYSwiQkVMXJ89mA/RXkZXB2Dt3Sg87EsSc15P
X-Developer-Key: i=gopikrishna.garmidi@oss.qualcomm.com; a=ed25519;
 pk=TkSjNEhrfsj90i3wkABTZtAjLNr2cfYsujaTvyOIDsE=
X-Proofpoint-ORIG-GUID: C9Yq76FZqchWWEa-xZ14547aW_1yNosz
X-Authority-Analysis: v=2.4 cv=f614wuyM c=1 sm=1 tr=0 ts=6a0af507 cx=c_pps
 a=Uww141gWH0fZj/3QKPojxA==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=8dCvXH1CdltW1_umN4QA:9 a=QEXdDO2ut3YA:10
 a=PxkB5W3o20Ba91AHUih5:22
X-Proofpoint-GUID: C9Yq76FZqchWWEa-xZ14547aW_1yNosz
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTE4MDEwOCBTYWx0ZWRfX1k0IzKCFDB63
 qROcflwCrqixXz5609s3Y7qyPkgSa0fSef6B6MNPeMlhRP2aMnwGR8+4ZIfSZDTNov7V0en86aK
 eH0GH9zhRSj9dZFzY2fphnXf+7JnKUh0zG6s5+JsCX7HMgzeVX3VXqqHTymtzuu6kY2vGmml0IX
 q5l2TSEm9gVqi5Hm5OCd5XOZZb7BeF7CdfbiOVvIFa1TTf+o788j3iWLXuYAiEDwnKDHQ7aQUSF
 QXBfjsh8YwoArbGyfU0WvGRyfO3NDhUn4yufl+uv9UVWe535thMcKffXKbvHp/FjhUhp4/Bvbz9
 FIILLmbzYo57fbFabPUW3d+y5MT+R9weZ0F3TClXh97gDYKGtRyIlA+dCkzP+N5pRZeI+jTU3fB
 8aQvowSO6+yC/jBJSW0xcw4MZShUA0Vm2n97DAzp//BMSNDhlZXI4/3cDrDYNBlc2IgcXJLrmpt
 7BzSSQ9cjByvMFcZ9Rg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-18_02,2026-05-15_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 adultscore=0 bulkscore=0 clxscore=1015 malwarescore=0
 spamscore=0 suspectscore=0 impostorscore=0 phishscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605130000 definitions=main-2605180108

The spmi_bus2 node was named spmi@c48000, but its reg property
specifies the base address as 0x0c448000. Fix the node name to
spmi@c448000 to match the actual register base address.

Fixes: 41b6e8db400c ("arm64: dts: qcom: Introduce Glymur base dtsi")
Signed-off-by: Gopikrishna Garmidi <gopikrishna.garmidi@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/glymur.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/glymur.dtsi b/arch/arm64/boot/dts/qcom/glymur.dtsi
index 0c5cb8532b20..849e66a33845 100644
--- a/arch/arm64/boot/dts/qcom/glymur.dtsi
+++ b/arch/arm64/boot/dts/qcom/glymur.dtsi
@@ -4814,7 +4814,7 @@ spmi_bus1: spmi@c437000 {
 				#size-cells = <0>;
 			};
 
-			spmi_bus2: spmi@c48000 {
+			spmi_bus2: spmi@c448000 {
 				reg = <0x0 0x0c448000 0x0 0x4000>,
 				      <0x0 0x0c8e0000 0x0 0x10000>,
 				      <0x0 0x0c44c000 0x0 0x8000>;

---
base-commit: e98d21c170b01ddef366f023bbfcf6b31509fa83
change-id: 20260518-glymur-fix-spmi-bus2-unit-addr-85018c01c8c6

Best regards,
-- 
Gopikrishna Garmidi <gopikrishna.garmidi@oss.qualcomm.com>

