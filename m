Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 70A3E366075
	for <devicetree@vger.kernel.org>; Mon, 19 Oct 2026 02:16:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792376165; cv=none; b=uXYTrfX/NM0XYSRAm8ErcV924iNHlBsTkLypeR/4yRx0huyJFGRKFiI3kQvZ+imBjgSHBJgERXmpMo+cibc1PeUDhGJjOtWQD8YAaDkFPfuCVTcy6ZKN4cgAmDAm0jSy8+cq2pDha8hJy2Gy1wDyHbebvPAqkHoe9c2Th5mUF2s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792376165; c=relaxed/simple;
	bh=t1/WRnFdjA+59SesNcKD+j9JerSR+CiQB1pnFq3Gmhw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=WKVUrh9nwXZUnVgvlMDze/Ut5Y27MKhAXeJ4tWbtGHcnYTpK2+hQs5rBCLsV0ScMHt5ykLYeoDEp6z8QkrDg3Fp2IRzrmfN1NYpXbcLzA7EdWxGBoFStg6iOCgZyfmPWXW8U6Ngz8lkLfAbphmh4WUv92h/U0HAZT/XE9mQjZZc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=F6yZMVh0; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=klodhL86; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="F6yZMVh0";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="klodhL86"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69J1FOwP244428
	for <devicetree@vger.kernel.org>; Mon, 19 Oct 2026 02:16:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=DfBFAFApxhj
	wHCm8/sm6IzDRf10uHpOaJHMfVRqm9Xw=; b=F6yZMVh02p/QmLtdhYCtT5AoX6E
	+B24FmLTB46yNeei2ZwgS6XUnSc9876o2Q7m4Yw/GSV78hQsiAZNNZBybjKbDW24
	5+i1uBM/7XAk8mT6ZZrWKbvLGmpJm6pA/9YJpy3EMtvVBF79Ss8m300FHKwL+YDl
	AmYXMSn8TyuGgj6vJb+RXukU0mbOk9IV8wMNipBkYlrArx1Hhlk/i5vPztjS0gb3
	IyzM6vmhr8IdxDG56uAa7pZHeMTLlRmI50i1EH9ipAlKsaNOwf1DLxwXRDAvntX0
	kFQpYGIlcdQNLPw4esjIIfQbHCzuX7gV4thR9+ZubqTvZ6SS1sTQs9vrUpw==
Received: from mail-dy1-f198.google.com (mail-dy1-f198.google.com [74.125.82.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hc1d7vew1-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 19 Oct 2026 02:16:02 +0000 (GMT)
Received: by mail-dy1-f198.google.com with SMTP id 5a478bee46e88-3580c07911eso5085677eec.0
        for <devicetree@vger.kernel.org>; Sun, 18 Oct 2026 19:16:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792376161; x=1792980961; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=DfBFAFApxhjwHCm8/sm6IzDRf10uHpOaJHMfVRqm9Xw=;
        b=klodhL868jL3vGtYyDFOTSItyW95bDe/UyOHdeqWSs4OXNuAYiXGEhIo5vy2445hZt
         3eeMHdpeAIg7TVx3gbQAhj0I/XV+rdJ07AVKeVXQgFyZLp2LRIDzvyfXyxiFD3hc91Xu
         c+bCnc6hvbYVBKbDb8wMvh28iZ5EcyiOlYu4Lkob9TOWUEK6imrDlaq+irwtFLVFGTJ/
         q+ZIJWqpmWmcgDEAbaPBKb7u4D+RqKyLKyFSaXBMG5Jlvs0FjJx8Y4Ey7B6K2D/THsjp
         0PS3zGvlv2L1yTtd7RR8Ic42qo2eGrGnENnJuvUmvii/8AlydnQrxPUogFmT7dm9YJSN
         xQFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792376161; x=1792980961;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=DfBFAFApxhjwHCm8/sm6IzDRf10uHpOaJHMfVRqm9Xw=;
        b=htnRAPmJQoAcf6YolPQPR8FddPxTIq/zBeyH7et2lBWGyh1R5YuUCEgP38h5HNJljB
         9UO7NULv8RyuojbWZXpg0MVopYh+d/8oe0ECdHmddM/sqowUyLCINqhT38Hu4QavJvNx
         K4kn4sSrzfXwnmgrhsAxVpF405zAxPOHDha0XHPxHWYBU+8iTYoTiNW4HL42W365MXjs
         TlBorPV3hq8kucaBSSCNvIIJAp3filJaMitDEEo57tCbKHRIhp4gCirwiNae0SCDkOMl
         oWULYugS7ph9Q0dTcd8SbfDfGQD42fIaNJOPAo6tjs2F7H10/IUc9aqo/1G03nJZviEp
         jy8w==
X-Forwarded-Encrypted: i=1; AKwUvBwyZ4uIO/kPU1wDZ5jMPigHVsamkUHgqwPQ9RFW0+9jKzVcArjDZpQ1KamYhO5PMJTvSpxBUEi6eA2d@vger.kernel.org
X-Gm-Message-State: AFq9FYIkX6TO0fJE6rA7gvz1OxRS2Cf5HftSEThY+yqV7kKTgW3ghq14
	aDzAmGMPi4jIYwd1RgmpjhNckuUJYAYkzlcAK0rOp3yOsKVhfksPEbTOWz0K9ANtDY7Ld8jpkFb
	HFEJ3q1LrJRS3NMUZ6yalNaegOFAkfSmfwDWjGzKxFLXClRZ/BCjIC2+6Efn0+nP7
X-Gm-Gg: AYBFou2ZtQkhxLQmqMulj9EClQvVckQdsf8jJCciVE1OSA29xgpNHakmtL/88/MgBUa
	qMkdPSx22IGRJsXCYff9VQePXKtu9OfZOtZek5mku+wI8+V6POtb/G7WRbWMY5k/uYFGKm3Trde
	mSWCArihpk3HqfkHlZe9IwrQDiW59B57L3SyQ+bztyxdcg0gVkOMnPgRSF0QzUWzeC92gDuN48R
	xeaux83UNvBah2dzQPwWSsgERjqjQmrsKNgueuyRJ6PeOLsigZuyondAvrT9pjvPACRdKYgjhfH
	nbcQIo+s8JLn11+6WlF1Wmx5Zx2xEr7TCwEBMmwzrgH3h1oNBF3ZVvFwm7TYSwKnTcQYVCOV6Ae
	XF9iZbjLTSqlnxVCKB/tVbTyjo4CXrKN0JfkG/RMiqPgk+WZz5A==
X-Received: by 2002:a05:7301:dd91:b0:351:5b99:5f36 with SMTP id 5a478bee46e88-361a1365d16mr8233093eec.9.1792376161252;
        Sun, 18 Oct 2026 19:16:01 -0700 (PDT)
X-Received: by 2002:a05:7301:dd91:b0:351:5b99:5f36 with SMTP id 5a478bee46e88-361a1365d16mr8233070eec.9.1792376160728;
        Sun, 18 Oct 2026 19:16:00 -0700 (PDT)
Received: from hu-petche-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3607ee0cab0sm33841550eec.3.2026.10.18.19.15.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 18 Oct 2026 19:16:00 -0700 (PDT)
From: Peter Chen <peter.chen@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Abel Vesa <abel.vesa@oss.qualcomm.com>,
        Wesley Cheng <wesley.cheng@oss.qualcomm.com>,
        Udipto Goswami <udipto.goswami@oss.qualcomm.com>,
        Jack Pham <jack.pham@oss.qualcomm.com>,
        Pratham Pratap <pratham.pratap@oss.qualcomm.com>,
        Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>,
        Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
        Peter Chen <peter.chen@oss.qualcomm.com>
Subject: [PATCH v2 4/4] arm64: dts: qcom: hawi: Set snps,resume-hs-terminations for USB controller
Date: Sun, 18 Oct 2026 19:15:47 -0700
Message-ID: <20261019021547.1694088-5-peter.chen@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261019021547.1694088-1-peter.chen@oss.qualcomm.com>
References: <20261019021547.1694088-1-peter.chen@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE5MDAwOCBTYWx0ZWRfX8wOsO5ZvE8VK
 xwHREQRKn/8IfXrqDUIdDceiq4Nghw2mNxjcLOT+s+a9WGHAJUzR3H2wD1hNu9qv6li1bSrc2Bk
 1rQxy6JGjNrCXrHS/OOktelxgtEbE8k=
X-Proofpoint-ORIG-GUID: onnC_KTL6vDhfQa1z3qCWpO2POc8tMyq
X-Proofpoint-GUID: onnC_KTL6vDhfQa1z3qCWpO2POc8tMyq
X-Authority-Analysis: v=2.4 cv=K4O3jCWI c=1 sm=1 tr=0 ts=6ad57d62 cx=c_pps
 a=wEP8DlPgTf/vqF+yE6f9lg==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22 a=EUspDBNiAAAA:8
 a=_PA-CDJEJREJmSlHXOMA:9 a=bBxd6f-gb0O0v-kibOvt:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE5MDAwOCBTYWx0ZWRfX5jTNur+S4ZA4
 vhkY7FPfQbHalvPSenOMQfGLrE45k0qm08jDLTCijpVx9WnHEGr/qwQf+kKrUKCzrPvJhUxofPe
 aH9920j59PcLzW4skVYC48UM0f6nlG/yxNdYA4udZhUGMXFjORnqo3M3CRIyIeLQ955i5r2GMC1
 STKinn37PNkV9XDtGlO5l2VvM9fqFN8cB5SSNrwnm2e99DSxr8F1fTz62MiTDwEtLi9rsEy3JXt
 oTwDM/pZHRzmjFLwU+eiuUzjJimBusClWnZm1zidKIedxwy8RaDeLyv5wCWMXTWACyH28SOWXhv
 sIfOLZKPmDsMSY8+fQUxXeOJsRwBX5XtJ2ERmQPIXH4PlKC0f3JwRvh4oOv9NX+WUHVyC8lXBlQ
 7dI5Sf7h0Jfn4EfGJ6EaHALjlFNJVW7dizusi7Q5DhiEXCHawgVm/f4fAZD1hT3HZgDNHMCGvIr
 Hk8WODzhCwgkTc2CYeA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-19_01,2026-10-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 spamscore=0 priorityscore=1501 phishscore=0 clxscore=1015
 adultscore=0 lowpriorityscore=0 bulkscore=0 malwarescore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610190008

The DWC3 controller on Hawi is paired with the M31 eUSB2 PHY.
According to HPG, host-mode USB2 L2/L1 resume with this PHY, GUCTL1[10]
(RESUME_OPMODE_HS_HOST) must be set.

Set snps,resume-hs-terminations on the Hawi USB controller. This makes
dwc3 core set GUCTL1[10].

Assisted-by: Claude:claude-opus-5-5
Signed-off-by: Peter Chen <peter.chen@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/hawi.dtsi | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/boot/dts/qcom/hawi.dtsi b/arch/arm64/boot/dts/qcom/hawi.dtsi
index c7ae8133b9cd..cdd660ef2dcd 100644
--- a/arch/arm64/boot/dts/qcom/hawi.dtsi
+++ b/arch/arm64/boot/dts/qcom/hawi.dtsi
@@ -3945,6 +3945,7 @@ &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>,
 			snps,usb3_lpm_capable;
 			snps,usb2-lpm-disable;
 			snps,has-lpm-erratum;
+			snps,resume-hs-terminations;
 			tx-fifo-resize;
 			dma-coherent;
 
-- 
2.43.0

