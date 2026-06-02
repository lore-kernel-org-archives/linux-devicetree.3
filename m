Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D7CD63845D9
	for <devicetree@vger.kernel.org>; Tue,  2 Jun 2026 16:51:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780419106; cv=none; b=kMcR4ytYrZyjuXX9BNDHzXsukKo44BHKGYZbYtMVCVB6mbQp95TdRe6Cj3WyG7k3uQvoqZUUEdXgSKtmxuca3PeUfJLGFjYhkoKtd7OWOXOkSp+04GUffgDqyk+oD6811zaM+B9LgdtkIJsj1SFQaSR4a/qBup83NL4XgfKzM84=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780419106; c=relaxed/simple;
	bh=2eDfwlwqlE3AF4FGiwEuqZdX2a2njMaGvqF4okZGNx4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=AQ0YBxakoa1PHvsuaXAYPlCVeOCmNTEA8f1SCc21Xg+IDDrvQIsH3C95Uk+QLpgjHTU7+lhj7pUNyzicn4djVyaMbAAeNxnoRYPgIplWg7+czPuLTlfvfP5S7Qe1DmaoEIQyddGqZsZc+wXaCuWTuVYzuBWwkTo8pa0wkS8jKYk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=AhYt0PXk; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=koAG2HwS; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="AhYt0PXk";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="koAG2HwS"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 652D4bZu2884622
	for <devicetree@vger.kernel.org>; Tue, 2 Jun 2026 16:51:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=zWMfIkSCmqLbIKAOmeZqRZ
	ynPj3VmhvNRt3uohhm258=; b=AhYt0PXk+qbw1RNo8pOeYZhNdBsamvZgTbaeUn
	6n6HxOlqifXDvll8Xg0HT+agf1vUD9bSlv4CevN38d/SoaaeA7bz3UZeATZCVf38
	FCeomDGeKjcranof/p/ba2CKemoiz6LOwibbe0qzbWzjqgvGYoxoZQ8m/Alh2sue
	j/I3x67DO4yjxbkGSD+VQ+SGmp3WXnInQg3mhJnjJPalPWAAWluMkhIjQZ3x0Ccs
	YEicmTOW53Owa7wctZuZRtoe7Wv53siUufxImtjEfeZ3dM3NVbg+B9+yPqImk9SH
	Slw5BJWhh+LVsMojtM4tZH0CjSx+hUe8OV9rje6/c5CfI7iA==
Received: from mail-dy1-f200.google.com (mail-dy1-f200.google.com [74.125.82.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ehsu12jcn-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 02 Jun 2026 16:51:43 +0000 (GMT)
Received: by mail-dy1-f200.google.com with SMTP id 5a478bee46e88-304ea42b025so2124634eec.0
        for <devicetree@vger.kernel.org>; Tue, 02 Jun 2026 09:51:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1780419103; x=1781023903; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=zWMfIkSCmqLbIKAOmeZqRZynPj3VmhvNRt3uohhm258=;
        b=koAG2HwSC8+X4Lruf8EPFUbDtUL7kYhLwIbqb7qFQqxvO5pForiyyoRUXIsPLh8z/m
         keCwCe7dFmSfEFuBHgJWOosCHKrqRIOiuXVT5AJMdSiKzKkV/pQrETFwYWV2N4UfLQbW
         GR2zr7H6vrDjbQxzyoZ16B6AvW/Y4FdD1Ms7dXvbL1T99CGj+cj+aV4dnsO3odKASxk6
         pzZmv1CCYr8m2jCi97+17fGR0JxS0f0jmmMX8x00YZwHlMaoeNVK5TXGYuoql9/OCho/
         UbFEERK0kn3PwIXq+sT81Hsa5dOJkpafpyYDmiQGGWK+QSfJF0dlb1DyfXsaGCMNYu7i
         9LhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780419103; x=1781023903;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zWMfIkSCmqLbIKAOmeZqRZynPj3VmhvNRt3uohhm258=;
        b=L+/kolPwUpDiXZbDvs7ObU6aagU/HUmv6ObautMIus2FK2nEHrbu4GRSzEFpTNnxEO
         DjJICDkqycTO1bMKGc6DXLgbGyiNnCdlZ2nsv5W20grWUtdrWtkaK11dDR2GCZQJ/ngB
         +1/fMTZgawIbu0Uvl5U60zhtmbROcLHbvW+CvsiJqs+wI4IfFbBoBZXbyA/eaql+KBbZ
         TUxRgGSHJbe4jumhaY3iyzqCQFkXlkO0uvF5xA+RQvXFobgsD9y2fANDoOMrBXZLxcTN
         fZZynonlrZ9ECRabcdGX1Faxe/CxfAlns98iPn6BQ/yMyCa9GwO+PHcn+ki2OeYy8QIS
         OKtQ==
X-Forwarded-Encrypted: i=1; AFNElJ89dHgPZ3uX6ps7nzfBcyksEqB3xxJ/UdrB/6dVs1Vueq5U7cqho3zSwAO24mv3Kqj0IzBMtwePSTkm@vger.kernel.org
X-Gm-Message-State: AOJu0YyBQ/j/2eb8rNSyN1vmnzJwoFlRa6nATg2E/SEriZ29ks/5i1BR
	ECmEYxXCxHYh0jQTg8kT7VhRjEGlrjyzyeHpGzE8T7S612/J6mjXzySJL9zo/LoEV+FjlY6ryxu
	AmT1qusG3QXf1cklMh/RzXyNtpguFoAeyqHYsCakxgcS/+koNyLg7uggzd1LvkvK9
X-Gm-Gg: Acq92OGysdby1Y9sixFuuiBc/1evctPSs7+tg/5GpSbVEnqpsmU/xhrla38PWENijzV
	q3Kfl/UDpvE7B1AGYwFHVslfotntlcsQfF5vISHLpIBSfamgSqJA+afsalvXGMiXZTZ/9Ajcu5h
	tDrFVHS8B6LHB9Jxqd6bWmOLTzUP9QqjhEQ6bR0hddwi+VwqMR0zFxuOYz53qLbeOnjHa/8qbc+
	w6/a9nYtYtYkUZHit16crnfxl4Y02mHuu0Qj04kbmtzJacSYJVARoU7ZEeeVZfAmBRAFxJqq+vM
	zDLp6Ua5XX5879KtWSsk/ODHR17z7X41l6JJoVSEoK807jVQA4iymUjcS0+KoM8K7Kcnw6V0sf0
	oGtkzwktoglrjMCcXiGX/TIwxboTmkXpllMX7/9ZX0sEJTkLqbLFLj7VETOoyICVY4B9qigIJa6
	M75nVrV/AiRINjq82Dxlq0
X-Received: by 2002:a05:693c:2294:b0:304:81b6:fd51 with SMTP id 5a478bee46e88-30734a8b867mr2454096eec.6.1780419102760;
        Tue, 02 Jun 2026 09:51:42 -0700 (PDT)
X-Received: by 2002:a05:693c:2294:b0:304:81b6:fd51 with SMTP id 5a478bee46e88-30734a8b867mr2454062eec.6.1780419102218;
        Tue, 02 Jun 2026 09:51:42 -0700 (PDT)
Received: from hu-ggarmidi-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-304ed53d14fsm12109172eec.17.2026.06.02.09.51.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 02 Jun 2026 09:51:41 -0700 (PDT)
From: Gopikrishna Garmidi <gopikrishna.garmidi@oss.qualcomm.com>
Date: Tue, 02 Jun 2026 09:51:35 -0700
Subject: [PATCH] arm64: dts: qcom: glymur: Fix gcc clock specifier for
 usb_mp_qmpphy nodes
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260602-glymur-fix-usb-mp-qmpphy-clock-specifier-v1-1-19c6f44d5655@oss.qualcomm.com>
X-B4-Tracking: v=1; b=H4sIABYKH2oC/x2NQQqDMBAAvyJ77kISaYR+pfTQxo0uNbrdxaKIf
 2/ocQ4zc4CRMhncmgOUvmy8zBX8pYE0PueBkPvKEFyILrqAw7SXVTHzhqu9sAh+isi4Y5qW9EY
 TSpyZFGN/pdj57LuWoOZEqUr/1f1xnj8rW1wNegAAAA==
X-Change-ID: 20260602-glymur-fix-usb-mp-qmpphy-clock-specifier-6d5e671f173e
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Wesley Cheng <wesley.cheng@oss.qualcomm.com>,
        Abel Vesa <abel.vesa@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Pankaj Patil <pankaj.patil@oss.qualcomm.com>
Cc: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Sibi Sankar <sibi.sankar@oss.qualcomm.com>,
        Rajendra Nayak <rajendra.nayak@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Gopikrishna Garmidi <gopikrishna.garmidi@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1780419101; l=1585;
 i=gopikrishna.garmidi@oss.qualcomm.com; s=20260102;
 h=from:subject:message-id; bh=2eDfwlwqlE3AF4FGiwEuqZdX2a2njMaGvqF4okZGNx4=;
 b=lujxzYi/r9wqWnOn/FLJjGBzLiwozzZeBo82HyOc2wvfOENrKbg05C/j/zX7+/Pa1cGlVMauQ
 PViNr1cdeNdDWAs9KQ/mqN7mDVuMwnRu9Pks55gs79HEvqGREZ/hm2l
X-Developer-Key: i=gopikrishna.garmidi@oss.qualcomm.com; a=ed25519;
 pk=TkSjNEhrfsj90i3wkABTZtAjLNr2cfYsujaTvyOIDsE=
X-Proofpoint-ORIG-GUID: 4vodsaHtHSlKxTOLNf12aJczyHYDV2CE
X-Proofpoint-GUID: 4vodsaHtHSlKxTOLNf12aJczyHYDV2CE
X-Authority-Analysis: v=2.4 cv=MKFQXsZl c=1 sm=1 tr=0 ts=6a1f0a1f cx=c_pps
 a=PfFC4Oe2JQzmKTvty2cRDw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=gEfo2CItAAAA:8 a=EUspDBNiAAAA:8 a=whlQpUbcimcIkjChax8A:9 a=QEXdDO2ut3YA:10
 a=6Ab_bkdmUrQuMsNx7PHu:22 a=sptkURWiP4Gy88Gu7hUp:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjAyMDE2MiBTYWx0ZWRfXxPFB8KSZ3AY/
 l4ZlU2mXkAPxYCxuNcR1EcdoRH2kVV8L8r0F+ZLFJDCzwF69fVAYtBpHmeg4tTRRJGVWK98J9+7
 +LmRVkqTMHj8tSr4ex/hxiSqxWp2YffPdqVgUDu3L6QxSEDfRWTBWM2i0IUhPUi0+qNQC+3OOPC
 /E9VBUYoxvZ96BVZEHISyVaDD6hDKeiRDiLfmqlOCjs2jQTeTT1heN+5ja0pZJPrw2ac9C96+q/
 EgU07+lzlhaI2Q5YYTPm3FCob/c8+UpEdyg81W4PMw90NOatUz6d2wIhhO72T6y0E3d/pk+r0B3
 A6PZeWfee2gsQuA//rmGrgpy+sH2QqDQNoubO0OYjbhgTQMCfahJykXUGg2C2jrC+8b+MFBEc+H
 KW7jbEwsjfG+tR4a7qb5d27JJNWg/lmCmG+M/QRrGPECYRLLojD2I4UfK7Kk8sPWR+anLLdJz5i
 kAN76BiAzz1ydoYsADA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-02_02,2026-05-28_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 priorityscore=1501 impostorscore=0 adultscore=0
 lowpriorityscore=0 bulkscore=0 spamscore=0 clxscore=1015 suspectscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2605210000
 definitions=main-2606020162

usb_mp_qmpphy0 and usb_mp_qmpphy1 have #clock-cells set to 0 so they take
no specifier. Drop the erroneous QMP_USB43DP_USB3_PIPE_CLK argument.

This fixes the following dtbs_check warning:
clock-controller@100000 (qcom,glymur-gcc): clocks: [[59, 0], ..... [0]]
is too long
from schema $id: http://devicetree.org/schemas/clock/qcom,glymur-gcc.yaml

Fixes: 4eee57dd4df9f ("arm64: dts: qcom: glymur: Add USB related nodes")
Signed-off-by: Gopikrishna Garmidi <gopikrishna.garmidi@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/glymur.dtsi | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/glymur.dtsi b/arch/arm64/boot/dts/qcom/glymur.dtsi
index 20b49af7298e..fd503e10e409 100644
--- a/arch/arm64/boot/dts/qcom/glymur.dtsi
+++ b/arch/arm64/boot/dts/qcom/glymur.dtsi
@@ -786,8 +786,8 @@ gcc: clock-controller@100000 {
 				 <&usb_0_qmpphy QMP_USB43DP_USB3_PIPE_CLK>,
 				 <&usb_1_qmpphy QMP_USB43DP_USB3_PIPE_CLK>,
 				 <&usb_2_qmpphy QMP_USB43DP_USB3_PIPE_CLK>,
-				 <&usb_mp_qmpphy0 QMP_USB43DP_USB3_PIPE_CLK>,
-				 <&usb_mp_qmpphy1 QMP_USB43DP_USB3_PIPE_CLK>,
+				 <&usb_mp_qmpphy0>,		/* USB3 UNI PHY pipe 0 */
+				 <&usb_mp_qmpphy1>,		/* USB3 UNI PHY pipe 1 */
 				 <0>,				/* USB4 PHY 0 pcie pipe */
 				 <0>,				/* USB4 PHY 0 Max pipe */
 				 <0>,				/* USB4 PHY 1 pcie pipe */

---
base-commit: 08484c504b55a98bd100527fbe10a3caf55ff3ff
change-id: 20260602-glymur-fix-usb-mp-qmpphy-clock-specifier-6d5e671f173e

Best regards,
-- 
Gopikrishna Garmidi <gopikrishna.garmidi@oss.qualcomm.com>

