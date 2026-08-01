Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 52A524334B7
	for <devicetree@vger.kernel.org>; Sat,  1 Aug 2026 10:00:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785578429; cv=none; b=SZyiHBPjyaJHonIw0+LeUaeOK8Yl8oiiWntoMoJlZ5bKaY7tO13n9xdRQ5j8ZRWKHzF+0jfTmKxGvCLMy/Bu71cX8sOFcsCv1gPqPCxaFnhQl5KPh1SSOJtuwXlKZ2Z1sxxfgoe3X4QjS5LdfjViW7VcW98ZNeNsPZu6DgQCZWQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785578429; c=relaxed/simple;
	bh=jkWeTjrNI+xze3hIGsedzEI8x6ITSkIXkZnnxBafFoc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=KHm//nXhl8nsjZd5VeBOiL8EHsxmeEiWCOb29jUJ9BEGj60V6FijMlUOvlEVWbl6dbqikcsWbk/KMhN6K5ObuihpK5DjBYyJEEEIaXuVfivh1SLy/eU3Hb0k72NtY7eM4iRh2oGxY3Zua3gl0rJKawyGCEEtLe6cN67JS17i8kQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=cXx3zc+r; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=NuZoVsXc; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="cXx3zc+r";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="NuZoVsXc"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6713PqNs1919170
	for <devicetree@vger.kernel.org>; Sat, 1 Aug 2026 10:00:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Uf2pAx6sV2vt+5z+Vbi+GKfH69mjyonF0TZZ0rYCIc8=; b=cXx3zc+rrdFwe+av
	UP1La1A2vDiRVnv4+zBe+7SPQ8+FH4ESaG/y0woQ5P2sf4f1QtyKxqy5MeWYM1xR
	qvDSVXHq1UU6BjUWpoO+T57S0wuI8NQpqU9Xhkbb4d0HEncrofmxJidkH+50Zwbh
	PM5mPWZKW21vZVid2ujGDjiye0LOvsl3dXqG9MspTl4xCLUx7Qdjxi3ckgjfJB3c
	v45frzRvv+vACHMPnL1iGqRmUExfixSCVtzqPqJxh9lOBmWGV7nADJWacGbTSBWV
	fx7PA3O1ZSwwj1+UrATsMJ8UgjZfzc+45vATrikXLO+dBCS3CLvu/FkB3Bk+fV/l
	PIrQtA==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fs8vt8pwn-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Sat, 01 Aug 2026 10:00:25 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2cfa55c9430so16095875ad.0
        for <devicetree@vger.kernel.org>; Sat, 01 Aug 2026 03:00:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785578425; x=1786183225; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Uf2pAx6sV2vt+5z+Vbi+GKfH69mjyonF0TZZ0rYCIc8=;
        b=NuZoVsXcK4uEvOqv8ws16SZYT3Ckc7wCaGJiNzVcpeFDGPnrBH0HuzQU+aXJ/kbuxh
         5og15EIyLFNhlYv93oFvlUWeW8RxnKAhjkhYLHlYrMCHyZfUJGrxIv7vYfJEvIliuAAQ
         acX/sizOhnenWx0koQLcAFDx+DTf1KL76HcJl2aLtucCPZ53Q4+RHuIsSrSf92DT+Kdm
         S9GdAs7Vpp6V/TESb4YGVA2w187QGE+31UtN7zzP7RUsrIJpcm1DapS+Ej5WbqFTDf+f
         mpp+PZXm5nRDIVd1wzTKZBbuLc6BcrHKB3jJadi8cB6k9rw4nIVNhStQqWsn2G/nWH1x
         egig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785578425; x=1786183225;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Uf2pAx6sV2vt+5z+Vbi+GKfH69mjyonF0TZZ0rYCIc8=;
        b=BeoqkR/4K6lSfbA8dE+N9I6ws0awJNVhJl8RBr9ERskj/2XPbo3Ddv3pyXI88FqiTI
         z3z3Ic68skMx/ACXKxxGwQPwQGZpsr82SWm5qNnmYLXXxVRDHCh14xvkbUQI1Osaf160
         zfa4ygBzlBrlc4egeIEGi9/kLxZoRPRAFlWWjdfZGyve0tXecTIYR+DKdG5D/4mggsiJ
         4LYk7avn8VlBevu8Hyg9OkCZAViLiu1p9IeAALMc/ab9i1yPQyGi0VlsKnsTtkowfuJT
         ecB9wsrB2C14qhMaes4bz/LOqyjtUb3iaGJ+1pE/CAyOgkSfbyBEwMvA24PIeg0i2NRj
         VlqQ==
X-Forwarded-Encrypted: i=1; AHgh+RrvDk9O0IcwYeIwbjVn4IsQk34vtc5zwjU6bdrlzw9iOz8ljDHo2UnGkdv+Gl7ZdV3JhSSwgExi1EBl@vger.kernel.org
X-Gm-Message-State: AOJu0YwqH9xaQsIPMRTC0QTe6TYph+Fb+PN6IOviokxttqIdm3lxcU8p
	HVHVaeTMkUdWfQgYtMB4r1GS6aRgHWPKrMSIfbDPMBaJEwhg3SdFE4ZAUKUt5ORMGbH0WeheKJm
	CMtc6Dj14qH2AcZ96brEbR2BNSU8JKcb6Z0of06X69EpbBay4eY9i5FHlT4ySZncL
X-Gm-Gg: AR+sD13Lxk0G1Q+R3j/d5mEzr1LPaPD+CYr8VqZ9fUOJ6iHLT8009DCeU6u0YEeEd9t
	JC6wXJ/eae3EbDUpMM31rBzDDwCrv6A/lbLvO9bYU3emKU4Hn9Y8UDk445QuqaFy4nd9BDqwSAa
	vcdjKjU0sy9q5yVJ5oHK1A7bk6yfvduk/2715GkTDqB9aqvSP5bSHBfXtYU/YeQ6YN5YFriVLmP
	AFJxckZWAaUq+6MI97h6gLx4oPUrwzSxoO+S0IwHvMLldo7GdkmVdsB+vYrCJ05N5mK9sDxZbim
	ZosEFojCsDkQdl3Mmc3t54SCNSocevj2gbrfX5kyVFIL9yuC66L2a3S8MF3R4yUvGaOEI5pVHkF
	zRdA/wWesoXg0u6JoS5l2MrzB5CzoSiTE2fzsVY1lmaFQJl9NzZT8O5wS6e20+t+G
X-Received: by 2002:a05:6a20:6f02:b0:3c4:68aa:8881 with SMTP id adf61e73a8af0-3c92a8f49d9mr2934140637.60.1785578424835;
        Sat, 01 Aug 2026 03:00:24 -0700 (PDT)
X-Received: by 2002:a05:6a20:6f02:b0:3c4:68aa:8881 with SMTP id adf61e73a8af0-3c92a8f49d9mr2934042637.60.1785578423793;
        Sat, 01 Aug 2026 03:00:23 -0700 (PDT)
Received: from hu-ggarmidi-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3153e04506csm16290600eec.17.2026.08.01.03.00.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 01 Aug 2026 03:00:23 -0700 (PDT)
From: Gopikrishna Garmidi <gopikrishna.garmidi@oss.qualcomm.com>
Date: Sat, 01 Aug 2026 03:00:19 -0700
Subject: [PATCH v5 4/5] firmware: qcom: scm: Allow QSEECOM on Kalambo CRD
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260801-b4-kalambo-crd-v5-4-22160abacf3d@oss.qualcomm.com>
References: <20260801-b4-kalambo-crd-v5-0-22160abacf3d@oss.qualcomm.com>
In-Reply-To: <20260801-b4-kalambo-crd-v5-0-22160abacf3d@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Sibi Sankar <sibi.sankar@oss.qualcomm.com>,
        Pankaj Patil <pankaj.patil@oss.qualcomm.com>
Cc: Rajendra Nayak <rajendra.nayak@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Gopikrishna Garmidi <gopikrishna.garmidi@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1785578419; l=984;
 i=gopikrishna.garmidi@oss.qualcomm.com; s=20260102;
 h=from:subject:message-id; bh=jkWeTjrNI+xze3hIGsedzEI8x6ITSkIXkZnnxBafFoc=;
 b=Zw2IYwT8czOEWhwP5Nn6g7ATaeYoxIVBv5COmtWa1hRqgb+bvGdvcx4IJkPT4rmq7WADLkrVx
 fYzqsi1wcMHADo5OWjib4yVK7s5cNRNqgNsHKJw1AG1bz8S4m3SF3UP
X-Developer-Key: i=gopikrishna.garmidi@oss.qualcomm.com; a=ed25519;
 pk=TkSjNEhrfsj90i3wkABTZtAjLNr2cfYsujaTvyOIDsE=
X-Proofpoint-Spam-Info: AW1haW4tMjYwODAxMDA3NSBTYWx0ZWRfX6Nfj3gPQsNX9
 p6UGKpGUP6b8puc4lTK2JhF5FiictoKnJYCw6icZiOpYWPVY6M9jUAK2lPG5TiLC2Zc6t0p6TOj
 ynqCiBzJbusKAJhOgNxWTukj6w4tanQ=
X-Proofpoint-ORIG-GUID: vwIQhVPgNb4UtpWrHRpxr4AjLXoK87fx
X-Proofpoint-GUID: vwIQhVPgNb4UtpWrHRpxr4AjLXoK87fx
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODAxMDA3NSBTYWx0ZWRfX4FD+h9IJz18m
 BFYvF3qLAUgd6ZX+Hfx/zyJM7FxkHI6ELJomTr70+2spZ+ZyZ8LGoDbVJsLL+CL5CAx2GMpUgQt
 ngekeZQeecXZerY8QvezPF8lqTz39h1dsByDkWmzj/PwXqsFLddYGfVs0f2750Ltd6NyohS9R5g
 c/usnrv7PcyBn8u+VlBP0rUM7vKT3gQD5ChnGpP9T2oGNYJTwAnMnpEYJZhef3LRw9uP4HkLpz7
 D8T0yev6A0qKLrj8aHcVru0xqxEOKTkUmhvpgNNsUHQeWzAiUxnMcm1f+XrdhxqNESH32+IK5JC
 5pK3xsrocAXyDT4kw7/dxyXntLM3MeKr6vTnxNRT52NB13A6ALAqIJPcaMYJ4JeCDepAuuHL5fF
 GrJNQTQH4TI29gzxQE0WWlg7jTwSWbXZ2+8xfSmxI1k4D295N+v/jP+0/FaXIteggNPqFVWimk/
 abMfT8VqORF6vgdEXzg==
X-Authority-Analysis: v=2.4 cv=fKMJG5ae c=1 sm=1 tr=0 ts=6a6dc3b9 cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=EUspDBNiAAAA:8 a=sPeBD9Pss2NjrgU8DtoA:9 a=QEXdDO2ut3YA:10 a=zZCYzV9kfG8A:10
 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-31_07,2026-07-30_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 lowpriorityscore=0 priorityscore=1501 malwarescore=0
 spamscore=0 phishscore=0 clxscore=1015 impostorscore=0 bulkscore=0
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2608010075

Add Kalambo CRD board to the QSEECOM allowlist for enabling access to
efivars.

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Signed-off-by: Gopikrishna Garmidi <gopikrishna.garmidi@oss.qualcomm.com>
---
 drivers/firmware/qcom/qcom_scm.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/firmware/qcom/qcom_scm.c b/drivers/firmware/qcom/qcom_scm.c
index f35f2ee39130..d1cc6c908daa 100644
--- a/drivers/firmware/qcom/qcom_scm.c
+++ b/drivers/firmware/qcom/qcom_scm.c
@@ -2327,6 +2327,7 @@ static const struct of_device_id qcom_scm_qseecom_allowlist[] __maybe_unused = {
 	{ .compatible = "microsoft,romulus15", },
 	{ .compatible = "qcom,glymur-crd" },
 	{ .compatible = "qcom,hamoa-iot-evk" },
+	{ .compatible = "qcom,kalambo-crd" },
 	{ .compatible = "qcom,mahua-crd" },
 	{ .compatible = "qcom,purwa-iot-evk" },
 	{ .compatible = "qcom,sc8180x-primus" },

-- 
2.34.1

