Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C62F45BD7F
	for <devicetree@vger.kernel.org>; Wed, 15 Jul 2026 13:29:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784122186; cv=none; b=LXaVCjcAkf2rrCt9fzCgVnfBdcaqtD4cz/TrWI3667sWy47zNOcmk9G1GyzTTsg/DG6KKd5Js031eo0xihDddB+9iY6DQ/PH9N6SHjB7eQ5NeeuO3jX1OsS4MvoMbM9dVM0FZkxVZcBxakXi3mLq4FqpNkrNE3l6XC26AHvTlKY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784122186; c=relaxed/simple;
	bh=lgJw3T8RtYLUAYqpf5FgYeQ5zhFb3RM5SK0Ilg7Us6Y=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=DM5dXqD9hqOhS5llfbDvvY/Qg67nXTlPBAMcLx3hsXvFjUEGUmZ1TfdskodHX7GGJZrqzijcN63SIYd9/uy8kIa2yyr2iHwF0ktrg4LdLwlbwrUND334puHo7SlBaEJR1dVtYSUaMG+i+lxcIgxGrgDLUnTKJKfitNSaJA/6ZsA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=I+l62H1s; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=KvbEXMvg; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="I+l62H1s";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="KvbEXMvg"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66FBd5uh3600293
	for <devicetree@vger.kernel.org>; Wed, 15 Jul 2026 13:29:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	bWrIrQWLZwcPUBR0eJtMVxeaCoMXC5+IB2Bc+w1N6mc=; b=I+l62H1saf2T1WXK
	1YnkxMhEfOP692fV92c8PL+gTKRVWBRjd6DugoGny0vvSW9T23PNWC1MNmfaiZGC
	DB0+UqrTKIsGnsz/rF3wPfVtSKt4LFBOIyjHntuVY1JNJJIlWr16UK04EUAgiBll
	Gc5xjMheW+WaqiSRQNd+HiYKz2CSA142CSppmtAW1R0wrKeHVbDOn4ekeoxR5vJ4
	2ogx5cclnCzdq/xO5VS8BNAIbE2knIGkxUaFM0OMfWk836J6wGgtubFG4HjeXP1v
	LeKPgPYjuv6iIE/VRTTuZHhioT06u5ZByivVP/J1ZSBx/J8FXp+edw9zcW3jep/Z
	htg/4g==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fe7q60uwb-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 15 Jul 2026 13:29:38 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-51c2af04aeeso28140241cf.0
        for <devicetree@vger.kernel.org>; Wed, 15 Jul 2026 06:29:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784122178; x=1784726978; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=bWrIrQWLZwcPUBR0eJtMVxeaCoMXC5+IB2Bc+w1N6mc=;
        b=KvbEXMvg7/qkSDi3RTE9L5D4gG2kwvi6wpWF2CM79ciYw27H3r9vf+951oNDHf9Slu
         l8u/J0l3tamFv9vOh7g6YtKe3Cxr4IaGrdN10uWshyfAjjTw/n8UkUlL34/VuMy+0oze
         ESHpeO7FLv2xqxICdatRzUOuOpdWKUdXQ0TO+jw8zGg696WllMn2LhsupcLZaBJzY3HV
         rBwHpf2JrdRzRxgM2BX6VkVJ4+aSdFVtxGQ/JeQYwyMgPAFUR1GyR6Y7OwI5bhBLzVFb
         MoMiqIVw9YcXyhxQ2jD9X8yLru5GO8yqn8caVrPeGAYYscDphm1kgfxulO2zhelfbiVU
         4nVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784122178; x=1784726978;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=bWrIrQWLZwcPUBR0eJtMVxeaCoMXC5+IB2Bc+w1N6mc=;
        b=TrcXbRvec6f8Ya+8Knw9FdTmma6tZnBolxVSpJaIoze/Sbc5yTdZeX5v6KogzRz8sF
         QSbFM4DOoMiC2QxjGhCQhxMveXGRlicHxxzZPCIII1rXocjNFtz9Yl/8YzQ4ABHK/gIn
         ILEtLeGqDQyluGvnwID1AN1myzOBWO4oP7leGnd5jncl+s+kyEvk0aMf05x+cOGfFI+w
         m4gcVCRfJpVtLKZ1d2Gwj0sbV69aV8rTDiuCId7ioUzAANCJqBVrEDQ5PpXtbg2j3fxv
         E51dFH9d9Md32BEjhp5Nf0G+kVKhUdfoXAKklFQvZycFNhKRJV7AB+hfhR1S0LILEcIB
         eyCQ==
X-Forwarded-Encrypted: i=1; AHgh+Rq6Kn88ELfe1WLZeiOEL5jsX4xPddpHZberhwo3pP0M0VCGcSBBWcXTi+RM2QNK+Mkpt1j7Zuhv3WZW@vger.kernel.org
X-Gm-Message-State: AOJu0YwKBhFdGmOCMHiokowN34p0Bu87HRTY8tSXOay9yWF+rbv2Ciq7
	2e0IilPrkKJHccXEKDaxulxzZrrms92HoZIm37bRJm3GPZbEnpFEwkOforvK6ziCtfqtBrPWbbT
	vwSoe8tqdFmcIwbvD4lmZbEmZJk84jrjE8xYVN+1MzKJecF16vNaaah8gv2cC2+7M
X-Gm-Gg: AfdE7clTWxSkjh0bCpHCE3HmbUoXvx1LRWr01IjLZYFfsxA62vCMBKMHZu+lVihIt4F
	nHXjLjm0P1eicv3qCRwja7TVgkiD0JfjsR3Z9kuvtncz00XoniAaEGdrHmn9F+x4i2//MukZ4aO
	WK2gCKMNvET7MxARMd3snIM41EPQn7MIjPkPD2wUURSKBghKqAlHQSIoLj3NkMkHXKJzU6yjFfq
	x+gT/e42e1DLe1KEnzJ07Kz0W0+v6qBy664ddgzXtnc2/XUwSfGNUPiQYn/h6ns7wdZ4SoCs+Bj
	iV5kzb3SoRaguNQevdkLC39a6TXe+7KoVyyGS3zbp4DGYG9fRh5/wR9+g27TFVLQom/ctarQ9Di
	SstJIC7J0QK5oIcQ=
X-Received: by 2002:ac8:57ca:0:b0:517:9407:5c38 with SMTP id d75a77b69052e-51caa1280famr219652871cf.24.1784122178093;
        Wed, 15 Jul 2026 06:29:38 -0700 (PDT)
X-Received: by 2002:ac8:57ca:0:b0:517:9407:5c38 with SMTP id d75a77b69052e-51caa1280famr219652281cf.24.1784122177488;
        Wed, 15 Jul 2026 06:29:37 -0700 (PDT)
Received: from hackbox.lan ([5.12.73.156])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47f4635a9cesm16945760f8f.14.2026.07.15.06.29.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Jul 2026 06:29:36 -0700 (PDT)
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
Date: Wed, 15 Jul 2026 16:29:15 +0300
Subject: [PATCH v3 2/3] clk: qcom: gcc-glymur: Enable runtime PM
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260715-glymur-fix-gcc-cx-scaling-v3-2-72eb5adad156@oss.qualcomm.com>
References: <20260715-glymur-fix-gcc-cx-scaling-v3-0-72eb5adad156@oss.qualcomm.com>
In-Reply-To: <20260715-glymur-fix-gcc-cx-scaling-v3-0-72eb5adad156@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Maulik Shah <maulik.shah@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Jyothi Kumar Seerapu <jyothi.seerapu@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Brian Masney <bmasney@redhat.com>
Cc: Krzysztof Kozlowski <krzk@kernel.org>,
        Sibi Sankar <sibi.sankar@oss.qualcomm.com>,
        Pankaj Patil <pankaj.patil@oss.qualcomm.com>,
        Akhil P Oommen <akhilpo@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Jishnu Prakash <jishnu.prakash@oss.qualcomm.com>,
        Raviteja Laggyshetty <raviteja.laggyshetty@oss.qualcomm.com>,
        Kamal Wadhwa <kamal.wadhwa@oss.qualcomm.com>,
        Qiang Yu <qiang.yu@oss.qualcomm.com>,
        Manaf Meethalavalappu Pallikunhi <manaf.pallikunhi@oss.qualcomm.com>,
        Abel Vesa <abelvesa@kernel.org>,
        Abel Vesa <abel.vesa@oss.qualcomm.com>
X-Mailer: b4 0.15-dev-bc6c4
X-Developer-Signature: v=1; a=openpgp-sha256; l=934;
 i=abel.vesa@oss.qualcomm.com; h=from:subject:message-id;
 bh=lgJw3T8RtYLUAYqpf5FgYeQ5zhFb3RM5SK0Ilg7Us6Y=;
 b=owEBbQKS/ZANAwAKARtfRMkAlRVWAcsmYgBqV4s1nYYjdGkiC1id63RUG6tg4KE8irc3UGMIu
 zXIiVjLJSiJAjMEAAEKAB0WIQRO8+4RTnqPKsqn0bgbX0TJAJUVVgUCaleLNQAKCRAbX0TJAJUV
 VonUEACOCuu0EncUyGXeK64Yp/lejNpaw1V/nThxQSRLtH5ZggNao7RREJuEg8tBVSLWDSvxWXc
 UyBjjxfxGvFLgZt9t/b67Bxi8EdmVnSF/n2CB0b7NpHWCxlvItMSsI3sP5CjpmLhfCijKesf4kN
 IoYo7TfPeTFu+T2yoWjBy29ssdmok5ajRN3GLfKLDNm4uesFPDS4gD5Ah55bW5Kob5uxfQXkiOD
 r8wV8cwKSNM+pzfHgwWV5She/Gvfh8MQS2gmMrWx5oPkCVmdp7TRjoNI2Uw2Aq5dpksIpwrnti3
 WR8SjUOvRua09RV7txnMe6fimqPFncsy0E44JhBU3BmeUuBDcS2RutvU/TUfQbFn5dLsyKcpe0F
 7tXL3vbzXBzvz/BaGQU0OH8QhFPqSAiglSp/3Wr3uva2LYZeNfiN8uqVsE2M4FHe/nQzgRWMcJg
 GfFokVlNLearVUOrS+YJqnIhLdxEfWEv5I81ssZhIQJdvcGo7xNrZa1EyCEWd20BtGVOFBjm1HV
 NEELaiOJMwAi4bz8vT/QQJ0mRVxeDBe0CxUkM30kWQP96+7bC25hTWJIKmBrq09ozv1HgLMswHe
 B3Cz+O/EwkwKWwUX7wrVWalaOhlpXA/G7HCTF+ff/7w+8C49c/ykJg2kIIDKAgVEvyM3MN7UCdM
 oLhNkbQqgw9mn5g==
X-Developer-Key: i=abel.vesa@oss.qualcomm.com; a=openpgp;
 fpr=6AFF162D57F4223A8770EF5AF7BF214136F41FAE
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzE1MDEzNCBTYWx0ZWRfXwj8ftKAdp6Vq
 YZjeRG2NcWjVEv5m68hn0Sew7Pm2N9U9Ha6Am1a0BPbLesAJd+fxnC4L13oQu6uWisiC6dy7kTj
 QLEMgvcXRqlKaqSMWpPGZeDOLTWLgrQ=
X-Proofpoint-ORIG-GUID: u8Erw-ZeI8MQpLS7kG2mUF30LlObtgMT
X-Proofpoint-GUID: u8Erw-ZeI8MQpLS7kG2mUF30LlObtgMT
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzE1MDEzNCBTYWx0ZWRfXx03ZDAcS65za
 hs/7lmnpDpWwqQ7a4XnQWF8rl6xguMPGn1ElWzPyvxI773sDIrS0unI9hoYZ9QF1QoTmnaWHcLb
 g0oGbr7Df68WiTclFBt+rMpa3u+OXD426d+miEagziA8HfMsc5s8dC+oaudxSP1P3TwGDs7XZ6n
 69DO88S5cm2hgf6JTdJ/bzBp7dFZu59/YL1iRZRobD012uFDLhS5OE5zmo4fatHO1dSfDc0zA4D
 KM2XegVx5SXMkeaWg6LTp795uNGCbWeqJwQcczPiie25yE5W5v+A6cqVqUGxqB8SwyXPpihlnxH
 0qjIFOStRTb666pbl/NkAYUGXGIMdJd/ejOzbzokP7ahV3r4Po/nKRBUZoPgoZOQvygeErIcpdI
 J/6pVCcRukuvQklW2oi2MK7HG9MnoSwRDIkr06YbTXTZqtpzl5rSxzF7LoPTf1KjkD6tJIj17uc
 fEY9YvOTLU5aaFAOOGQ==
X-Authority-Analysis: v=2.4 cv=BajoFLt2 c=1 sm=1 tr=0 ts=6a578b42 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=qUYP/O48JsHWwiZSxXr1NQ==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=EUspDBNiAAAA:8 a=s1Yi9tfhbzEvHx3U_YYA:9 a=QEXdDO2ut3YA:10
 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-15_02,2026-07-15_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 phishscore=0 malwarescore=0 clxscore=1015 bulkscore=0
 impostorscore=0 adultscore=0 spamscore=0 priorityscore=1501
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607150134

Enable runtime PM for the controller so the common GCC probe path resumes
the attached domain while registering clocks, resets and GDSCs.

This lets GDSC consumers propagate their votes through the GCC provider to
the CX parent domain.

Fixes: efe504300a17 ("clk: qcom: gcc: Add support for Global Clock Controller")
Signed-off-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
---
 drivers/clk/qcom/gcc-glymur.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/clk/qcom/gcc-glymur.c b/drivers/clk/qcom/gcc-glymur.c
index 6925c6865089..2ee4820b6fdf 100644
--- a/drivers/clk/qcom/gcc-glymur.c
+++ b/drivers/clk/qcom/gcc-glymur.c
@@ -8548,6 +8548,7 @@ static const struct qcom_cc_desc gcc_glymur_desc = {
 	.num_resets = ARRAY_SIZE(gcc_glymur_resets),
 	.gdscs = gcc_glymur_gdscs,
 	.num_gdscs = ARRAY_SIZE(gcc_glymur_gdscs),
+	.use_rpm = true,
 	.driver_data = &gcc_glymur_driver_data,
 };
 

-- 
2.54.0

