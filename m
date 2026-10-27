Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793101815;
	b=4b+07/1lmiuFSDx/lh8uXaDDlro/X+LNKNjnqQQjZS17Ub5EWlFuAAkl6us67jsO5eiF
	 e3aeITBkTRROSrtu3DxI7Jqn/BOvsaiqR8S1pu1SbXnr0nTUHuuKJLYRTu1u7CxssGSe5
	 hx7ad1S02zm+nkWQOHGq4LEFr1DqnF3AImoi90py5JcrYlvmKRC+KLG3C0Jt0w8LkYIEj
	 lpKrA5w+1QMv0oC2kndd/kCbHnlzf9LqBFi2hmAXHHHmrF6r8Y1fT304uAo8nvIhcRNzw
	 uUvPuf7QYao2SYY6Vz1venf8QN6Wt7OeGbu0mu199NIkgIDPG2jDCeMo+V6ZOq4hUDg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793101815;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Authority-Analysis:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=1b94Txq/lwmxaDtayj0mrEaKFPzEZIPVcW3H/HTvxDE=;
	b=yd/a7vhPYStj1OnXbDQz+fXbygdioDdkdOL/+9dGJhRVhvWFoQ7Mwu3U/y7ArDuspg+1
	 mu7RUh1kKPS8c5bQ1TKOyd7Q+1PimUYwKc7uJD6PzPY4no8rMVRKKelc11xpIAIeeCigT
	 juQ82/RZhpBSMrBaIwVKe3CXtGEembzezFJYj/LBkVyjWlIp/KHEo1yanac0ux6LiIpVQ
	 jv6EUzq1S+vBp02CYtQgZQUv49lyuciDqSEixDSSsaz9SC5zPN3BbDWXA3LlY1VwcHsPs
	 9U5MPjgQzHsvR74L2U1zkWF8mCXKWM7jBriBtLrxGakpfeOpbtzHGFzc9osHLy8YBAA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=d1glalQs;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Y0NsVbba;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1EFD9606A329
	for <devicetree@vger.kernel.org>; Tue, 27 Oct 2026 11:50:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1EFD9606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=d1glalQs;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Y0NsVbba
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69RAdsAC1921592
	for <devicetree@vger.kernel.org>; Tue, 27 Oct 2026 11:50:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=1b94Txq/lwm
	xaDtayj0mrEaKFPzEZIPVcW3H/HTvxDE=; b=d1glalQsrrJyN9SaGwigFvB6h+R
	am3hngFEAw9IxUAdMMXx0D7PuF29llpXk0RBu03fgpRs+BziSayIJghWxwTSUBE6
	pNyUzQlK6GyolbMm7X6h0qirolJ1iVPdgzSb6codHF2f8Pv20aYiHEN20/Ced6op
	C7N1H5d3gDXDGY6xYNcmQbFB/iRxbDDupURzsYU0XQ8MMuBjSiL7PDkhFnQFVbGm
	uJo8WWcXNmAO3CJrti8jyIZvRFDToZtny5kviUco40dihptjo+wt8HK0o6cjMt/l
	2PyzvCUv2NFLG30/lpvodLu0lKNPKLcSHxXwHWGBO3hKyqL//RMxkQkqmIg==
Received: from mail-dy1-f198.google.com (mail-dy1-f198.google.com [74.125.82.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hjrq68psa-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 27 Oct 2026 11:50:14 +0000 (GMT)
Received: by mail-dy1-f198.google.com with SMTP id 5a478bee46e88-3552883bd19so2030187eec.1
        for <devicetree@vger.kernel.org>; Tue, 27 Oct 2026 04:50:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793101813; x=1793706613; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=1b94Txq/lwmxaDtayj0mrEaKFPzEZIPVcW3H/HTvxDE=;
        b=Y0NsVbbaMUtQeuhsxbvkLqWzGOei0E88PN6lkKwBvkJ3NTbNwNXe5hQqdZ9TNKMDv5
         vUm1jgKCLsEHY0UgY6eRgIZmT/MmQ4LSBuo7PeZbtJa14imbfUouDpj7gfdt7ackEY60
         zJFs7sLSqeQ9lwgRmVBNMAsAkcmqTAS8KdqF2dpXqoTD6SJPgKFMnwhVIqv7JEWTtRNS
         sWCfHo6wwQeJyHbA/bwNktOS68u/mFxJ0jQ6ytZp5ajB/XnusqYixCVcr6vIiyMAMS8c
         t0jW89b/xZA/5YmgHgOsa+0cc4ZxSzhvIAdPlJb92Vten3hIXBH2DkehSdFXb3VdJ46Q
         3qfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793101813; x=1793706613;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=1b94Txq/lwmxaDtayj0mrEaKFPzEZIPVcW3H/HTvxDE=;
        b=HcNpno7XTWD8h20hHhTebg1LOvbiaJGnHSWjD4bzK5AyUJPNnA7UwA9baS5gxRmGEE
         PYFfiv8/G4DTMbWp0so920qwoHXz2fkWSeJU6GFBOII2VD1u+b6dbAsiWooR0LqZGZBL
         m03WOUrCvLFlo8STKUYNNlkZFj5X8A/hCIRQWrHqEQ6aRsUKGoA4FZ+39S3OCORFNhK+
         yjOziiRvKbUlKULqq/P+0qH/OmdAsIFXR/oNHGl4eJIi80Fg51PH8lqR1ajtm6Jt1GQV
         TM0RAmChnbUC9fqU+Zug0UscoQDUF/z5wrtvBrU6h/LkZ++5BWp7yRjItVDVzScaSEjU
         bzyQ==
X-Gm-Message-State: AFq9FYLW/J/5U0qPBPHbh+dDYFZyRVd1bvIK0vPDMcfiqcdp4ry0sqoT
	FSrC/nO/br0x2ds1/DzoSKevnyNBXrqSupZa6I5Dx2HbikS/4Y1VsHtYwhn4ck6Dnk20XT3omMs
	WsU4i9nWSmrp8fkwJtAtYJAMSeY4dKH6KuEH6/QqVN6PVWw3p8Xf+dJ6wLowpRb6X
X-Gm-Gg: AYBFou1uuS2DG3OXv2oQXIFupJBnaspnDA0lr/snZ5M2QkH0j7TEeTMm0Rz8pxDVc8Y
	RPxWVaAWdhXmNbcObsZNWcc4s5HpSfsq8sXMfoC/41BsNwvwhEpsDEV/Izu3p7nlymWCZkSCoCv
	YixvOSLRbTuqLIlLTkD+p4JRNOrtUxir8JVxzqMfMKABuz5pCZYv0rdH0/jTT0Set6NETKS78vP
	+vshz/P8nDSZCTLlYCdP8fgnQHhKqAUZJZPfccpX/wj3zUidlrPyBYjvOxxjPzAJDxsdHE6wrAi
	wVqk1i+pboGKYflS7wryg18e1Gthk3vzBjZzswEoDuRARaD32dTQl7WHOlWC8ZftVXjEQ3Yqduv
	l5gXPubHp04gD0NvV6IWHvcTn1Z6fIO9DpkJq0t0YIkXuDn5DQgTgTJ8Q0C+a0HXCFrUQiWk7g3
	xVgbKpAHJBzAtEs/y3XazL0A==
X-Received: by 2002:a05:693c:4018:b0:369:f05d:6c5c with SMTP id 5a478bee46e88-369f05d6f61mr12713570eec.28.1793101812967;
        Tue, 27 Oct 2026 04:50:12 -0700 (PDT)
X-Received: by 2002:a05:693c:4018:b0:369:f05d:6c5c with SMTP id 5a478bee46e88-369f05d6f61mr12713524eec.28.1793101812229;
        Tue, 27 Oct 2026 04:50:12 -0700 (PDT)
Received: from hu-sivagupt-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-369e8ec50bcsm61918825eec.23.2026.10.27.04.50.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Oct 2026 04:50:11 -0700 (PDT)
From: Sivansh Gupta <sivansh.gupta@oss.qualcomm.com>
To: linux-arm-msm@vger.kernel.org
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        andersson@kernel.org, konradybcio@kernel.org, abelvesa@kernel.org,
        robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
        Gopikrishna Garmidi <gopikrishna.garmidi@oss.qualcomm.com>,
        Sivansh Gupta <sivansh.gupta@oss.qualcomm.com>
Subject: [PATCH 2/4] firmware: qcom: scm: Allow QSEECOM on the Mahua QCB
Date: Tue, 27 Oct 2026 17:19:53 +0530
Message-ID: <20261027114955.1266499-3-sivansh.gupta@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261027114955.1266499-1-sivansh.gupta@oss.qualcomm.com>
References: <20261027114955.1266499-1-sivansh.gupta@oss.qualcomm.com>
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
X-Authority-Analysis: v=2.4 cv=RYwFmFtv c=1 sm=1 tr=0 ts=6ae08ff6 cx=c_pps
 a=wEP8DlPgTf/vqF+yE6f9lg==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22 a=EUspDBNiAAAA:8
 a=QKtFLHZR5-43mdkG35oA:9 a=zZCYzV9kfG8A:10 a=bBxd6f-gb0O0v-kibOvt:22
X-Proofpoint-GUID: qv7nFSdKWbT3Hu2XtnSsdBTX9zZmqDyD
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI3MDA0NyBTYWx0ZWRfX3GDMOelCO9AA
 HTfhhmE5Ou+3Kb1ROeXGMT8ugXCKhZ1wPSgqBo3kYhAj8QzPSWCdLUj3NRhNTMkzNsKoXDCwyOh
 lP2JzPz6mt6VfPTMd6m8YGM+NetoqME=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI3MDA0NyBTYWx0ZWRfX7vcFDFW3B/yq
 CrNRPRC6ZBT9U2BKOtsZVEuXbOd1gtNQv4TiHMc1h4vSL28ZTgYJlDckRZVbIRryyPuIn8Z8SlS
 yVa6G0GclULx+iMVPuvdKPhLdMx8P9h9AodMskk59y4mfVtCo5ZgIXN5YVDEcuoZSho7vfjuAsH
 V/xxkrc1NlqqSDc7yeG9t3UTx+WomuGno2Yk5jueKnNk1Mhfasa9v9Iy5KxjJA95oF7/31fdhvN
 E+1FoHTcBXQPD4wJTqujG7RlufcXNICQdLJIXbGCGfr/FVUFkR9YOJz8xS9ITrQ+Xx2eHJYkTCI
 xyhztcOeqxl4BjN/svZhz1ABvL1Z4nTUjIXqDyzUEW1Tivd+YUs24djEokKY7QhwPpUL96mzIbz
 SXJv5wi3ULg62OUrUGADCi68YLJx9d/zM+Yss8puOm1gxw+jvr6x9UrSEKDyzgPdPSoSMp8vbvi
 iwx5Qu8GAgzYiIIMIPw==
X-Proofpoint-ORIG-GUID: qv7nFSdKWbT3Hu2XtnSsdBTX9zZmqDyD
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-27_02,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 impostorscore=0 spamscore=0 phishscore=0 bulkscore=0
 adultscore=0 priorityscore=1501 lowpriorityscore=0 malwarescore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610190000
 definitions=main-2610270047

From: Gopikrishna Garmidi <gopikrishna.garmidi@oss.qualcomm.com>

Add the Mahua QCB to the QSEECOM allowlist for enabling access to
efivars and the UEFI bootloader.


Signed-off-by: Gopikrishna Garmidi <gopikrishna.garmidi@oss.qualcomm.com>
Signed-off-by: Sivansh Gupta <sivansh.gupta@oss.qualcomm.com>
---
 drivers/firmware/qcom/qcom_scm.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/firmware/qcom/qcom_scm.c b/drivers/firmware/qcom/qcom_scm.c
index 43e250faea75..eb262928d4c4 100644
--- a/drivers/firmware/qcom/qcom_scm.c
+++ b/drivers/firmware/qcom/qcom_scm.c
@@ -2260,6 +2260,7 @@ static const struct of_device_id qcom_scm_qseecom_allowlist[] __maybe_unused = {
 	{ .compatible = "qcom,hamoa-iot-evk" },
 	{ .compatible = "qcom,kalambo-crd" },
 	{ .compatible = "qcom,mahua-crd" },
+	{ .compatible = "qcom,mahua-qcb" },
 	{ .compatible = "qcom,purwa-iot-evk" },
 	{ .compatible = "qcom,sc8180x-primus" },
 	{ .compatible = "qcom,x1e001de-devkit" },
-- 
2.43.0

