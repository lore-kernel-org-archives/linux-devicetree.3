Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9BB033AE187
	for <devicetree@vger.kernel.org>; Mon, 10 Aug 2026 08:54:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786352089; cv=none; b=gt+PtxkamyfkwSMyHr/U9blohpOZWyk/qSLLi1r5Ue9TJ46VTHzZytg489+j2CYW7Li3JR5RFbOoSsHJnqt6WFF6bT+a6bO9WIHRFNuMMl4EAFGPVzu+ITquYy2D8tsnJpPoeXmXZGXT4Jo4vhQrk6jBd9AkUjd6YIBNLU/VwIw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786352089; c=relaxed/simple;
	bh=RHx2BAFXtCsslhO3MJpO80rDfTPFP0dhBtEOARtB/Wo=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=bB/GLVAwoYfLwMb/Q7dzjY3VuFskFyQWy8A3YmZpAiAc1hVyAGG5qYOvTJ6BIrH9O60fpWrATcquWcfsF8lT6b2DIVSeLMdJtADY4NC7rTVJessFO0JF73GBZXYphI7bEQ/QL+gHJEjmokrLmJB9R8gZNJ0Ck2KewWjTsM2f5Hw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=PY90/hth; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=OiybSFK5; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="PY90/hth";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="OiybSFK5"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67A5pdTN385529
	for <devicetree@vger.kernel.org>; Mon, 10 Aug 2026 08:54:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	t1jwOnPC893cuCMeK03JEiLjIaXrpYSrWYPXc8GZBLQ=; b=PY90/hthxFYNB2hG
	Eu5iXKVnYqy9nFTpBDPSST2d5qFTiD2Sjk9Lru0fUdeF30dSMqkHgd6qW1brrQsR
	lg4EuhueQVhEswBwDT7STf1koQ0zKrTPDM/MjsguMRy7oYDSCiMGvUFOvMHH3fKO
	k3JICRuQ8BaKpzY1zvv3CBHSgarHyKZn309KaoDzYJBNu1P6lPHyCv/fRn8Xgulg
	Eo2VlFS81KQXKR8Q4ESpbT3YCbtYfn4JFmgKecSiDZzOS+CzlvEX6Ywij9RthtFO
	PHVnHRX3sBnVo+FhdESpctn4JhhTwX6pxeEmFfglbpsrKcVZx1W46qVjhN98k1dt
	WidU0w==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fy8v58js2-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 10 Aug 2026 08:54:46 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-38ea32e57e2so2177438a91.1
        for <devicetree@vger.kernel.org>; Mon, 10 Aug 2026 01:54:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1786352086; x=1786956886; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=t1jwOnPC893cuCMeK03JEiLjIaXrpYSrWYPXc8GZBLQ=;
        b=OiybSFK5DQqMU2rTPsY56Dz3OJs7t0qoeP0pSY7mRB0/3rgGyNBNtVnV0/1kDZeZP6
         l1cXt0Fh1cVG3Xx0WvbVxL2cxuw42tEh+QEeUFfTnqYO6vBjxOy1LMVdxSNqne0DBcuQ
         vKN3V/gplqDnnDoBIHU9mG+SkQ28NzxG5ymTyfkgjzJBbkLIFBTnQm2vcUMZZ/arpNN7
         HlcYztXUVt2UWsOzIkfi+aI5n3mE5OcpfKrYYjTAmMVo92IVlIZHsdOT8FtxLqtrj366
         PodP/KN8jk+MYl5R3Ud7t+a997PskRTII29cYDf4k+tCN1mgs5oe0QHQa7FJmMgWI2PX
         df6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786352086; x=1786956886;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=t1jwOnPC893cuCMeK03JEiLjIaXrpYSrWYPXc8GZBLQ=;
        b=H9KmKcFScLJ52h8ZXrDjMPNeoyd3eXM4kXmQNH/c3ek0rcmcx199ljdXZBjpBYOBpb
         Tk7HyHaB5cQqY5/25wKHZQHHhNwiRf3woVps4uheYlCzeSbunX4zQx+fuNQFc/Gl6cMW
         T0QTgjcC+wgWMXUqScf/hTRk/VA21G+p9KSXPLM3nGdqrhdEF/jyiNxcmdQydtTeVuEB
         ikop8EMOHg5NiPNiITJjjBfnODNjdze2tB0BgWUHJBG+rqLsGPpPm7Lk/tbJYiq8ESNh
         clYzJ6V30UJ/DQ2EblsTObDqKPgqnPq+Yz5LveCSpqSgQmwaNdzjlJAbId2zhHxCohPC
         tF1A==
X-Forwarded-Encrypted: i=1; AHgh+RoS6ba7hsywE+De44dOTqbyMVISFnkobs2YJfew5KYwHS3lkhbPeWDdE/ahd9oq+YHJEoFqw6CX1ZPc@vger.kernel.org
X-Gm-Message-State: AOJu0Yw0VaYwgbU0YPTN4yfkad2A39+AAOKNSfPJL0z2hAJcOTv/iUAc
	O/x53pBV8ioiKGZVsdUzpwcx/aGmyA/25yM5iXSBPqOi+zS2hrYflKUczN4R4qhF1/uMATT5Gzd
	FKZ71JMOBMTOHGVh2JkJGQig6w9H8yYVaLdbDfKO8yGufWLWvxc/MpDC/VheaJxj0
X-Gm-Gg: AR+sD10cWH0J0dPPzNpIYMy20WSaiSOP7bUlQ8xlTwPi8H8Q7JORLTeemDtoR4lrV6E
	ZHKxqNTVAyS71waVk8g2+akF618nRbILxp2UV+TqndAvCAcTqJixX1/NiUnu5Me6lUiC17qXyo2
	c3PdWGf4/3KVp3W5rEJGIhDEh7snLCKepd8saYYhJTKMkvS70VJyMXjurjs5teUdz/IFSjW5Cr2
	zzTkZJC91PBrmuSw8BRjmqgByIN7OsW/hK0PlN+YtiRZEEh4N5Us8yJW/3N8QfHJiFeTqZGLIin
	KTJNxBVQjxtpPfQgs2HJHP1e3HsUeTG4TIrFdkrqDytsmm0zFysxSwG0U6Fw++jU1yjt6BDbJAq
	aQ4D6e5VtlPhOB98PwFP7cy8kEBQeUX9r/cQr++bX3LUeVstaDhQfv57LjbbDsVFH
X-Received: by 2002:a17:90b:2dc1:b0:38f:de97:b06 with SMTP id 98e67ed59e1d1-3903c535d79mr45967714a91.5.1786352086042;
        Mon, 10 Aug 2026 01:54:46 -0700 (PDT)
X-Received: by 2002:a17:90b:2dc1:b0:38f:de97:b06 with SMTP id 98e67ed59e1d1-3903c535d79mr45967678a91.5.1786352085613;
        Mon, 10 Aug 2026 01:54:45 -0700 (PDT)
Received: from hu-ggarmidi-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3925ff69eabsm11840085a91.15.2026.08.10.01.54.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Aug 2026 01:54:45 -0700 (PDT)
From: Gopikrishna Garmidi <gopikrishna.garmidi@oss.qualcomm.com>
Date: Mon, 10 Aug 2026 01:54:35 -0700
Subject: [PATCH v6 4/5] firmware: qcom: scm: Allow QSEECOM on Kalambo CRD
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260810-b4-kalambo-crd-v6-4-744e8ad1dae9@oss.qualcomm.com>
References: <20260810-b4-kalambo-crd-v6-0-744e8ad1dae9@oss.qualcomm.com>
In-Reply-To: <20260810-b4-kalambo-crd-v6-0-744e8ad1dae9@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Sibi Sankar <sibi.sankar@oss.qualcomm.com>,
        Pankaj Patil <pankaj.patil@oss.qualcomm.com>,
        Qiang Yu <qiang.yu@oss.qualcomm.com>
Cc: Rajendra Nayak <rajendra.nayak@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Gopikrishna Garmidi <gopikrishna.garmidi@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1786352079; l=984;
 i=gopikrishna.garmidi@oss.qualcomm.com; s=20260102;
 h=from:subject:message-id; bh=RHx2BAFXtCsslhO3MJpO80rDfTPFP0dhBtEOARtB/Wo=;
 b=RMPFxaVX91DH9eTLmJmeRYB/9sFxaiQ6P317mkv05Lndxrlh2E0H8vCUO6BqQX7hg2ZgAu7B2
 X6T395kF7SeCmSXCunJx/+sASFoN23PMqVMtSL5QhKF735NJo/8u3M1
X-Developer-Key: i=gopikrishna.garmidi@oss.qualcomm.com; a=ed25519;
 pk=TkSjNEhrfsj90i3wkABTZtAjLNr2cfYsujaTvyOIDsE=
X-Proofpoint-Spam-Info: AW1haW4tMjYwODEwMDA3NiBTYWx0ZWRfX3BrAl5GukSrh
 OUm0d+A+INuIz2B3zcXHtM+wgXX28sVc8EBaMz8ZUIbvE7KsKDOQLFSbtxdKM6QvubNdwf6aJT2
 odhppDEacLREibkWaJOpOUzHaLYIDRg=
X-Authority-Analysis: v=2.4 cv=J6qaKgnS c=1 sm=1 tr=0 ts=6a7991d6 cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=sPeBD9Pss2NjrgU8DtoA:9 a=QEXdDO2ut3YA:10 a=zZCYzV9kfG8A:10
 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-GUID: 9ju1uPGJ7tSjXLkuYbqA9Xr3WLC69QF3
X-Proofpoint-ORIG-GUID: 9ju1uPGJ7tSjXLkuYbqA9Xr3WLC69QF3
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODEwMDA3NiBTYWx0ZWRfX4LA4l3ZZv+EF
 R4PuC68y9Krqa+XgrkclTtv7f9rElIwvdf2y7kV2TJ4/SaJaeP7MGV8k0F3niNtv/G+XiKpUDqK
 WXA0ty/Rz28T4/YxQS5KEkXYtAc5LgFrp44ESlJqD0XOC04BzhdVnBA2Tb+/YMm3/9zcAx91DuJ
 RdVd0uu6ohhqtwg3jyASDVetRaLs/sS0iYhoSdFKMl7cXNFZYz9T2KQAxTyIXfmaYMRkejbyn6z
 Brmz4mDgzkVKCnz8FHtVxJbdE7MPioX1y3mh0dpc+8wlWBZkEmy0oXhKZFntfBpTlpbJaiLt75Y
 xLBdr7NPaOBInOl3jTorNzcyBvjG1lP/DIOisshlf4UKv9T0z9ErsAx6iZhOBteB21/gA3Q2UcB
 2Rpa3Y8flVk3r9kopC/VtyQRW03hpCfsKtKdyKCr6yLT4mez2pn0SWHYlrCTHKrPxqTTJIkFNg5
 Yhp/lgxHnGwy5K46V5g==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-10_01,2026-08-07_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 phishscore=0 spamscore=0 lowpriorityscore=0 priorityscore=1501
 impostorscore=0 clxscore=1015 adultscore=0 bulkscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608100076

Add Kalambo CRD board to the QSEECOM allowlist for enabling access to
efivars.

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Signed-off-by: Gopikrishna Garmidi <gopikrishna.garmidi@oss.qualcomm.com>
---
 drivers/firmware/qcom/qcom_scm.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/firmware/qcom/qcom_scm.c b/drivers/firmware/qcom/qcom_scm.c
index 3eaa4c9ccf3c..1f696b815493 100644
--- a/drivers/firmware/qcom/qcom_scm.c
+++ b/drivers/firmware/qcom/qcom_scm.c
@@ -2328,6 +2328,7 @@ static const struct of_device_id qcom_scm_qseecom_allowlist[] __maybe_unused = {
 	{ .compatible = "microsoft,romulus15", },
 	{ .compatible = "qcom,glymur-crd" },
 	{ .compatible = "qcom,hamoa-iot-evk" },
+	{ .compatible = "qcom,kalambo-crd" },
 	{ .compatible = "qcom,mahua-crd" },
 	{ .compatible = "qcom,purwa-iot-evk" },
 	{ .compatible = "qcom,sc8180x-primus" },

-- 
2.34.1

