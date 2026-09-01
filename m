Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D56E246AA7F
	for <devicetree@vger.kernel.org>; Tue,  1 Sep 2026 07:31:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788247900; cv=none; b=uy5btMfwNVvZL0sD4NykrmXkY/BIaCgsYWGa1xgxqR5kqGVEAP8WKT9zgFPqvoa6dPa1c78WGpQWtDSzjwc1WUmYCuaAzIYW+rjB2lPoRK2GxCmYLUBiEqanump0aOUjWgHAE8w0yZ71N+A+0sFYcqlJ4Cm5wcOZcKU13fFQao0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788247900; c=relaxed/simple;
	bh=SlQ5VdwZvVStQeZ2eNH8zzR3a+C3sg3kvTYpgF54crQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=VjySwIk9wGPmKKRgpdr4Rl/nvtwPKOsN3FABcWLGSuraXG7TXNf3tcwsl4EEeXFWyNRyPEb8qCJksJe61IlpvHXLoWwW4gDVMNzOSPUkmaS4EeOvtd86D0o3saFx7mn0+vrsuYWE1hWQt0iOh6C52cwsDB3onqAxaX9q+olootQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=lqbLSOqY; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Towon0+2; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="lqbLSOqY";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Towon0+2"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68179Jpn1709543
	for <devicetree@vger.kernel.org>; Tue, 1 Sep 2026 07:31:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	oEX3ve3HSx05suSaJfa1Byw2nUsa5ubBf9KhTj7eXdc=; b=lqbLSOqYAexpgYaW
	NmIFEarmQEXrLcAFN0PG+O6UUUsaT7Qyr5Hw2ikzisNHF3E5mz8lOZI9LwnYuOkK
	k793p0AdR731+oV+Ggor4F97VL3is94sLTa6ctKCij8Gyv+e1X9kajKHwW6tpOlK
	ZsnMEfLa2eC06AEa2nQveLqPhL5eyEHB7ztybVRIBjKhpo+mSLfPPH5t3Azvl/zk
	OB34FVTTjbMgysIHtG9c5B8dFnWykZhp8TJ+pQQeyRmI0aVevrQTcxraOHUXgTDX
	DIP9tVeygf9H6lriQFkQLWKsm9sZRvuCx+hokLQVz+vdPsXpEkkg+obFS0XzAqn2
	CyyQmw==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gdp8fs109-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 01 Sep 2026 07:31:37 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-9382f9430deso127493885a.1
        for <devicetree@vger.kernel.org>; Tue, 01 Sep 2026 00:31:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788247897; x=1788852697; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=oEX3ve3HSx05suSaJfa1Byw2nUsa5ubBf9KhTj7eXdc=;
        b=Towon0+2Q9xt7Tn9j/cfT7ZblzSUDnitSQPvBQuFeAs+toqYWieSDZ3igQkL01Zz07
         169ZZYA4nXenoLcJZTqFgLz+tJQjfGp26QT7OpC/PUEfKd8MlPxyq6K7P9+lHfUxHC0Y
         1ybfq+4MFzBlsuSAqCPEzsrxlkSqnjsEjx5/BZAuL2gJTYIKsWhHJkTOnidK1VqEr1yY
         kfkfqVYDyFMhyqtYIe7IokncmqyfXpVKYgVA6Slv2/x8pTuvLfN8sRF+TQcmSRlS94z0
         pb7RvAZAbhcFIpMQHLIzAvIykJZudpf+MHRSUKWxy//kh1heY6ZrtK+6cnr9DyPMJVr3
         VJUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788247897; x=1788852697;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=oEX3ve3HSx05suSaJfa1Byw2nUsa5ubBf9KhTj7eXdc=;
        b=sROl5zsJVQZj1VbMd+1if9hUTc1+nqwSduNHKbrtjbvXAYq1QUq/k7GMisiLM3aubQ
         Da0rLBqyJXrwem/LB18MSmBZx2whLavts401iOElddjOQnFVQ3LdK+m86+bNfhpxpzlZ
         CBIo3aBORTWy3xUuL2I9L1FsTWO7G6btlBmK1J+zieQxaf7N667kZYdIi5Y/NIoNO0sC
         LykU2UyMx0XSsXheTZgkntUNhapRVRvOjAzZ5qWECsZMhN2YAeUMOsldRPRuB++/Bxob
         zFB2u1LUqDOYHmMpweOuMjdBVpJ37fnO5PvSKPL9EAYEsQYikq8oO68w/AkVkMPCJKYo
         OKxw==
X-Forwarded-Encrypted: i=1; AHgh+Rrs7dOlELDy58Iz/n1lSTFiQsoCngDMHWE2ZWpsbasCTSA0Nypeb7nAk3Gk52Ki6QOeLaz2Ow98S06Q@vger.kernel.org
X-Gm-Message-State: AFuF++k17RGuKUQ/NtS+dSSJeWVSaaCiUIh7riseiEK4C1e/YIIIsfOR
	2tatfzAKC24FY+ULsyPW57HvQ2ZAhKgs2AKK+6yqXHVLjkokebdHFKyhWn1KIVPsUBOrDcVGslh
	7vo2PmDak2J3gkYNj3Qd6brVEgIdsSjVY+L2Fpb8iEJ8OmSPMyAs8ILHgXyeA36jP
X-Gm-Gg: AR+sD13iOQK60Z+nGMitAWIL+mGxxRFakN3iVCu8d0cCFIvKiSsvIjMqnJrHfJ7toXk
	uxjQi0blth3t+FS6T7dp/el2ywy7FQIlqCggNQadd7YuH/f6XyTOWArPQpefc1uoeH2rG+rAKP/
	Ge9d6tqvh/akt80Q+nVfbb+6ms+U8E8YhKx2OAgjpLFjiJxl6nYh2438lLas4/gysV/U4xoIGTq
	AJM9EeJX13KxAlmXIVQ7Ia7zgL8Na9176hDJ27g5gcn8EnMSBerXSvc8zwWD8wqqmsAS7edpX8x
	CmotO0dfa6v+j6fCTM30kKXvTuqb2WvCe1B7pbeZ1JE8KTj5pgw92bD//YOjPi10uV9KUsyVfHW
	6ZuoY2F+nU1hfWfpwgTFUSD91hn88h2GEDlHnhLB21QqqJQAje7hDM4q+I//wPD/lWCIc
X-Received: by 2002:a05:620a:7101:b0:936:ca57:25da with SMTP id af79cd13be357-9391396bbf1mr3297859185a.37.1788247895982;
        Tue, 01 Sep 2026 00:31:35 -0700 (PDT)
X-Received: by 2002:a05:620a:7101:b0:936:ca57:25da with SMTP id af79cd13be357-9391396bbf1mr3297854385a.37.1788247895352;
        Tue, 01 Sep 2026 00:31:35 -0700 (PDT)
Received: from WENMLIU-LAB01.ap.qualcomm.com (Global_NAT1_IAD_FW.qualcomm.com. [129.46.232.65])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-93918b0f825sm946766785a.40.2026.09.01.00.31.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Sep 2026 00:31:34 -0700 (PDT)
From: Wenmeng Liu <wenmeng.liu@oss.qualcomm.com>
Date: Tue, 01 Sep 2026 15:31:05 +0800
Subject: [PATCH RESEND v5 2/4] media: i2c: og0ve1b: Use
 monochrome-appropriate test pattern name
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260901-og0va1b-v5-2-b0400a9bac01@oss.qualcomm.com>
References: <20260901-og0va1b-v5-0-b0400a9bac01@oss.qualcomm.com>
In-Reply-To: <20260901-og0va1b-v5-0-b0400a9bac01@oss.qualcomm.com>
To: Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
Cc: linux-media@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Wenmeng Liu <wenmeng.liu@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1788247879; l=842;
 i=wenmeng.liu@oss.qualcomm.com; s=20250925; h=from:subject:message-id;
 bh=SlQ5VdwZvVStQeZ2eNH8zzR3a+C3sg3kvTYpgF54crQ=;
 b=iO6+Xl2Bs5MIFb+zyzdwJ5KnH2bH94waL30vJH91jONK5TBQF1w4COF/EQjWi/dnCRlXRFhDV
 jR4JUzDt+J3DWWO6X7wojOdX7Bffg/iVIKNzMlYyoeJLAi8jHeU4UwJ
X-Developer-Key: i=wenmeng.liu@oss.qualcomm.com; a=ed25519;
 pk=fQJjf9C3jGDjE1zj2kO3NQLTbQEaZObVcXAzx5WLPX0=
X-Proofpoint-GUID: mPxSeB1WLMosP6zTqAKQAIky0E5h_fkU
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTAxMDA2NiBTYWx0ZWRfX+nDoxG7f0zxe
 miZZ54T98wz0MQymaHT6WvOOsd6ISYYDdU/v35NrjyTPlFDF4VH0djXV+51d3mte6ilImWTx5OC
 X8it78uabL2rFXGHcIVJYMb2aYTJqbQ=
X-Proofpoint-ORIG-GUID: mPxSeB1WLMosP6zTqAKQAIky0E5h_fkU
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTAxMDA2NiBTYWx0ZWRfX49+HqwNMi/Ym
 It6Js23w4O+hCNpLrKwJm0IOymgP1Gg8IKNFVc35LP3R0HYmwrP9UHGjRyoHKb21YqVMx8VfeFn
 fmC1Wn0xpFLE3xam5dGHLSu4NnNzFiwckggzLaolc+y/XQ09M+e+28zaTa8O4vf6ryNVpjqPO6R
 kNuMk+DQRiqROCJVNvSYcf7WrFdHnygqv2PwMJPXb6SagcErMA/E8D/3qtDFl9TVIg5lmFGDYkz
 UzuQQuTQicRy99dnvnlnIqFL3BMK5CSImuPZM32gJGmObmYztX1MqrleU+y2jcmqvAlhASEZI5Y
 5XAwbBc5ZCD5esBeXiRGyskkFpVX48Ml+5JI3eVQ1K4cGrp4URoyS+jOB2Ghwo2YDxp7SepX7Vj
 FuLkQndi1SlncqwGGW9sLH+vbYssOUavxnlcSjNhlziRXSYMD6oq7Y2xhK0eSioJywNEsNeqTk+
 FlrFNYsihGfaQFsRlqw==
X-Authority-Analysis: v=2.4 cv=BPWDalQG c=1 sm=1 tr=0 ts=6a967f59 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=C3Dk8TwHQYyIj7nOf9RCJw==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=EUspDBNiAAAA:8 a=ni8zlDty7YU4e_isgz4A:9 a=QEXdDO2ut3YA:10
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-01_02,2026-08-31_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 bulkscore=0 phishscore=0 adultscore=0 spamscore=0
 lowpriorityscore=0 clxscore=1015 priorityscore=1501 malwarescore=0
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2609010066

OG0VE1B is a monochrome sensor and cannot produce coloured test
patterns, so the "Vertical Colour Bars" test pattern name is misleading.
Rename it to "Standard Test Bar" to match the OG0VA1B naming.

Signed-off-by: Wenmeng Liu <wenmeng.liu@oss.qualcomm.com>
---
 drivers/media/i2c/og0ve1b.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/media/i2c/og0ve1b.c b/drivers/media/i2c/og0ve1b.c
index 84a28cdcade10f8fbcf945999e88f84641b9bc0d..da5c8e49d4a811f55736bd89c6922856f2e7391c 100644
--- a/drivers/media/i2c/og0ve1b.c
+++ b/drivers/media/i2c/og0ve1b.c
@@ -72,7 +72,7 @@ struct og0ve1b_mode {
 
 static const char * const og0ve1b_test_pattern_menu[] = {
 	"Disabled",
-	"Vertical Colour Bars",
+	"Standard Test Bar",
 };
 
 static const char * const og0ve1b_supply_names[] = {

-- 
2.34.1

