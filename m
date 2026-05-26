Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 12A503CEBBD
	for <devicetree@vger.kernel.org>; Tue, 26 May 2026 08:53:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779785592; cv=none; b=i+DZZKPTWil5tk/8RdVad6A0/FjmrE+AsWrXJ1FWRdPhMo3iVXikS4dRvMO7287SdhpBcb52sKndWDvp9RtAAQXirNwWM2B8Y9B2tnAco2xw2uUXROwbJPpziZ0hksE57MA8PrX4R8/WM75WE7cJgOMI52Sh5jFRA7O3t4zBj58=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779785592; c=relaxed/simple;
	bh=6dwjKXpdQIOHdZ4McKq+nYOl6X4s0oJJFQKmLJGEN0U=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=n/qdxOu20kZFpDfm/xtYhqhyfVy6IfSVPLLibao0R/4jnDs+IdQy/58vph8yE551sHHxHe0vqw7ZUPIYng2IufsLaCCQFHLiYPc/cRKMcKTjINaLtvJx7+BkqFQkqIhrpBFgSJIz6IStIpTnmvn9yA7UmY1kqN1qSn9XO9Obbh4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=XeNbgbB8; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=asVwiRYZ; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="XeNbgbB8";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="asVwiRYZ"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64Q83JOt3603971
	for <devicetree@vger.kernel.org>; Tue, 26 May 2026 08:53:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=RVoZcULGEjGW1rN/Iq0DEm
	0850ecwTybL4jJLvdoIhA=; b=XeNbgbB84sKaW4B8kXqO2iF3LVKRw3jyfqKboB
	VMOm6KqM0D8uxdlyN0zla4BXusRvmOBSJfl5Jomuem1ozjcyxvT5L+fgNxzK5KOQ
	7Toy2KJBhGFzE9bI+drC271a1aRwEwQ5Au+7IcQMCTXK0kMpvv274PcT3vOk+qb0
	y9J2c39v7g1vC+suDwvj/FSfKZmcUyp+ywfKHpjk9uJTZIhVFLt4A9uaQ14g2YAH
	uMnU+uJvz5v1/Gau5WLrObWI3F2TEK8s2QiSa+eS6k47B2DYymnHjGOhZVFj3U6F
	aJgX0wr9uOXuGvIZ6mb6bbL5h0KQsNFBR/oui1hoKHGAW7bQ==
Received: from mail-dy1-f200.google.com (mail-dy1-f200.google.com [74.125.82.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ecpyqk674-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 26 May 2026 08:53:10 +0000 (GMT)
Received: by mail-dy1-f200.google.com with SMTP id 5a478bee46e88-304627c66ddso1995836eec.0
        for <devicetree@vger.kernel.org>; Tue, 26 May 2026 01:53:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779785589; x=1780390389; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=RVoZcULGEjGW1rN/Iq0DEm0850ecwTybL4jJLvdoIhA=;
        b=asVwiRYZIfh+4tIAveEDnaG6E8HsX8BqE/ZOEJWzGHQfcASM9j1iWLqw/ueh74CXln
         6ixUH6knJP5wMzW76bl5aCuo1FJ9GIrwLJt/k5EyTuM4djeW1tyd0AUvCxF8KwCwMWDv
         RucAY8vOPHMXjbGk35ruJO5CAK/8ouhaWDrRX5n1KPuWcmE4Z0VuIuF8bPQo6RAR8vWV
         LxMsTktTJjJaqLiYpqJOmYdrQlKQ2I8gK6kP1eqfBDsCAlIkGV3VBDxQdP4+bQhZJvDF
         x2YDAJUfPE0JWn1DxBq08a+lk4/pDKofnWmloLqXe34olKL9P4k5w0/qMbArQKoQaJfJ
         Jb6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779785589; x=1780390389;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RVoZcULGEjGW1rN/Iq0DEm0850ecwTybL4jJLvdoIhA=;
        b=hcnVAvw8jvyyw31JTVcNAB54Y4rLs9JiUOLYBk1GQ/14RSEUZFM+zLHu4k73oc7eG9
         BwdmxjfWLuas5h6LZlNAnoa4mlv/+/Vexhvj8/BmrT8yD0KhMkZ8bQrpGOBpEbnkOqJo
         PRJ63tWuDfP48nae4UX0wx9KfWXTad7V++JsUBba1c5m/JH1INDJSkwsbVuhXMIMmRsm
         KR6/64/8ZUr46AuW7Ugordmv6w5hfd7Vk4xF361BMPqrD/6D9MpDc2NbKyXvVY35Vb+d
         FnSV154KNpIbRVL876EWo6tVWYbxFZ91BTPA/ncoc2UQnZ9g8F6w6EElxV2DH6qzyfL3
         dX4A==
X-Forwarded-Encrypted: i=1; AFNElJ+BdJnCFdvcgU/JS1JaACUJIKH1uJXCHyvr4eNaoWNh2W+buTs5pTttiNLxmeXU5fEETlYaVpuCjZ76@vger.kernel.org
X-Gm-Message-State: AOJu0YxXrKzQ/vgqJV3KQu/5cKf2y5BbxdtX3WCECmfAIwfbzBQQqkdI
	mU8scxKMk1h0v5q45fBkZz4hMFSc8j7uF+PxF3wja36poMseXRJgZ/7trJjCyp5yXoNCe2QQtnm
	FjKpYSC2BzD7hNnfznxQh9aPS8/kVOhYCSBH7SF2q6nJ7SJwKxEN3BjXcbA6qzoTNuBeK+Eiw
X-Gm-Gg: Acq92OE/e0zfkd6rNsg3Q1ZoWvZlSiTZek8bf5ngkO06X3ZSgdHlMwHTGkcoGpgzA9+
	Hyr+jkix3pf/+qip/Z+YhPIvkATlzu2DHnj2n2FZj+E+GY6hHH4XNkwT41XXubgYQjBHHnjHGpJ
	onKSp0WaHGlyJxDJi00qDFbQNkoRe7mnCi+Ct/WIgf6DsJFXcU8AZVleoWY4SY+HIAdbrSFY9BL
	wPk/3GuNDwP0lIg8WPKhZ48FpwnSnxxKCJ32XbJB7VH2K/Fko56TE6yjOmcXZOLwQMz8IeEkK8R
	BoLhsOaiGeF14cXcUxW6ZqwgugxHexFQVIweYgyUM75b3pZWocfOS3xzv/UdImejUVedXZPCxDo
	kWDfA7n37DEa269C3wTvaFD5Oi/7nFyW4sEGeX0+u8XJBGq4pFWbXcJdCMHZu54WIr2Wbe/nVli
	zcQVoFATLu6Q==
X-Received: by 2002:a05:7300:cd86:b0:2f5:3641:f110 with SMTP id 5a478bee46e88-304491f39cfmr7245236eec.31.1779785589477;
        Tue, 26 May 2026 01:53:09 -0700 (PDT)
X-Received: by 2002:a05:7300:cd86:b0:2f5:3641:f110 with SMTP id 5a478bee46e88-304491f39cfmr7245228eec.31.1779785588963;
        Tue, 26 May 2026 01:53:08 -0700 (PDT)
Received: from hu-ggarmidi-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-30451ef4719sm9921260eec.1.2026.05.26.01.53.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 26 May 2026 01:53:08 -0700 (PDT)
From: Gopikrishna Garmidi <gopikrishna.garmidi@oss.qualcomm.com>
Date: Tue, 26 May 2026 01:52:57 -0700
Subject: [PATCH] arm64: dts: qcom: glymur-crd: merge duplicate
 &pmh0101_gpios node extensions
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260526-merge-duplicate-pmh0101-gpios-node-v1-1-c4ab4983f8be@oss.qualcomm.com>
X-B4-Tracking: v=1; b=H4sIAGhfFWoC/x2NQQqDMBQFryJ/3Q9JaES9inQRzIt+0CQkthTEu
 zd0ObOYuaiiCCpN3UUFH6mSYgP96GjZXFzB4huTUaZX1vR8oDTp33mXxZ3gfGxKK81rllQ5Jg+
 2Bi6MYxieg6UWygVBvv/J/LrvH8OCC7Z0AAAA
X-Change-ID: 20260526-merge-duplicate-pmh0101-gpios-node-52eaf99f8485
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Sibi Sankar <sibi.sankar@oss.qualcomm.com>,
        Rajendra Nayak <rajendra.nayak@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Gopikrishna Garmidi <gopikrishna.garmidi@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1779785588; l=1650;
 i=gopikrishna.garmidi@oss.qualcomm.com; s=20260102;
 h=from:subject:message-id; bh=6dwjKXpdQIOHdZ4McKq+nYOl6X4s0oJJFQKmLJGEN0U=;
 b=JDdIB1pKcxiRZbw6FwkdfKXENqU+pAJtDMtFuCnoTJgTVZFuj19YBuIGFbfiZ1rxhvEUyiI76
 qBjurF7bri4Adl2pr9Xsq3K75Gqkh3Q7MlBTOE4Cn4aWi07TU/cBZl1
X-Developer-Key: i=gopikrishna.garmidi@oss.qualcomm.com; a=ed25519;
 pk=TkSjNEhrfsj90i3wkABTZtAjLNr2cfYsujaTvyOIDsE=
X-Authority-Analysis: v=2.4 cv=dtfrzVg4 c=1 sm=1 tr=0 ts=6a155f76 cx=c_pps
 a=PfFC4Oe2JQzmKTvty2cRDw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=EoTlI1rpe4zGgeXVSq8A:9 a=QEXdDO2ut3YA:10
 a=6Ab_bkdmUrQuMsNx7PHu:22
X-Proofpoint-GUID: xm0paOayQ_XOugho5g8bdIxZujgrUjw7
X-Proofpoint-ORIG-GUID: xm0paOayQ_XOugho5g8bdIxZujgrUjw7
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTI2MDA3NyBTYWx0ZWRfXwwv3ecQ9f4kD
 9d6BkqZJN+VjHvTYtzf0J4ja0/M0LXsiQHnwDq+snY07L1d37bYm7QeFCh8NMeXZxn1+rhJ1Tl8
 izJfrQmMhvF0WJZI+4mTSeXqcWd3afKkvXVbQIfmNA6tBErvPQwbqzOXBJXoGG6YoIljG/7MF4H
 oo0L3lVaHehfB1jxkarMd866ys4x8XjZVNOoXok6ECdereD54POfye0lKsyGaqbyeFdnHh9aRTE
 XRwsOY3nPVP081QF39p4kKo4lKLtmuXSp76tzQi0tZWD4UjxYKr6dlWbfvYMw02NyyzeHkMnSwt
 FMZ4x19y+Fl2k7ZD6v5B8C4DIwTC/fiVuzhadsaeSCGQX/esl86AtZigMCK8hzdM21z2eHMksZk
 f+eSzpoqtATDz0E+berHGYr2CsgyLSlUVo9FpM03p99nXsh2WHG4v2etW1WcXGVeMQrmxRZ2dLx
 +TpedJ2Nw67lyCiqWEw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-26_02,2026-05-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 spamscore=0 suspectscore=0 bulkscore=0 phishscore=0
 adultscore=0 impostorscore=0 malwarescore=0 lowpriorityscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605130000 definitions=main-2605260077

The &pmh0101_gpios node is extended twice in glymur-crd.dtsi. The first
extension defines the nvme_reg_en pinctrl state for the NVMe regulator
enable GPIO (gpio14), and the second adds key_vol_up_default for the
volume-up key (gpio6).

Merge both pinctrl states into a single &pmh0101_gpios block to avoid
the duplicate node extension.

No functional change intended.

Fixes: a5ad8a8e473c ("arm64: dts: qcom: Commonize Glymur CRD DTSI")
Signed-off-by: Gopikrishna Garmidi <gopikrishna.garmidi@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/glymur-crd.dtsi | 16 +++++++---------
 1 file changed, 7 insertions(+), 9 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/glymur-crd.dtsi b/arch/arm64/boot/dts/qcom/glymur-crd.dtsi
index e784b538f42e..faa149b02c69 100644
--- a/arch/arm64/boot/dts/qcom/glymur-crd.dtsi
+++ b/arch/arm64/boot/dts/qcom/glymur-crd.dtsi
@@ -543,6 +543,13 @@ nvme_reg_en: nvme-reg-en-state {
 		function = "normal";
 		bias-disable;
 	};
+
+	key_vol_up_default: key-vol-up-default-state {
+		pins = "gpio6";
+		function = "normal";
+		output-disable;
+		bias-pull-up;
+	};
 };
 
 &pmh0110_f_e1_gpios {
@@ -553,15 +560,6 @@ nvme_sec_reg_en: nvme-reg-en-state {
 	};
 };
 
-&pmh0101_gpios {
-	key_vol_up_default: key-vol-up-default-state {
-		pins = "gpio6";
-		function = "normal";
-		output-disable;
-		bias-pull-up;
-	};
-};
-
 &pmk8850_rtc {
 	qcom,no-alarm;
 };

---
base-commit: d387b06f7c15b4639244ad66b4b0900c6a02b430
change-id: 20260526-merge-duplicate-pmh0101-gpios-node-52eaf99f8485

Best regards,
-- 
Gopikrishna Garmidi <gopikrishna.garmidi@oss.qualcomm.com>

