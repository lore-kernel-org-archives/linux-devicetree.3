Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D3328417D87
	for <devicetree@vger.kernel.org>; Mon, 24 Aug 2026 11:55:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787572535; cv=none; b=ea8eofFpyJaWCuJigdr45PLC90aTWfck3ZnSdnUKcs1MsOeOPvJYGuTuUsnjFJ6Wo1mc8tw0Lcd0rba7Ro5/Yn1H77xHqTeTzRqCFLB09IKXAZYvt+VGe1Z7M+fwUeCQneEs5ReJGQoLiIy8m21lyjrFiJdOoyS5DWS3fIV9ApU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787572535; c=relaxed/simple;
	bh=59MxJ74vpUH4TMLPJbZqNrnZ7WIN0Fa1z9MpubowHEg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=gVlbHiccLp/u2vQTiYG1IJWQGacbZPxhEqBrGGPCEkEZ/DrSjc2Jz8R4dGXSG4UaQTtFdXt3/PUZMmbJo4n9itzIeybav3h9fDEId/fEzSH39DsJo8zlLE4tItSTaMH22TaAIYY3/Aya4sb1pkcH6vqbnASxp0PlQC9n8BvOPlw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=a0KcCkwy; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Z0oCupdj; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="a0KcCkwy";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Z0oCupdj"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67OBMaW53869990
	for <devicetree@vger.kernel.org>; Mon, 24 Aug 2026 11:55:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	qN0ApeMbMDjoyqaP8EXkX4ds4NYn9mbqOQzihITsKB0=; b=a0KcCkwyk5KJDgsi
	2qJ+CdPfTb4ShqzSguGreDtsR5nCe+5AjEOSLtbX4VusIMvdkHgrKL+be5lK+K/E
	4AC44gOPDcNGHiBZqzgNSVWkB6BhFvovAuY1NlU+h3DP5Kz0D1iqOf3YNkCCtH4c
	svarTLi5Z4tkFvTv/xxf/h5QmQuPer9kYVnVVJWfNB7JHad5hFwg3w7xG8E2KJl6
	DIURjKcXAtuM10O0YhdbtVIyPHd2BhfzzYQ5BNhMytNOIFnFAYurUUgMfJ4eR3YB
	RzqnqwATPEXkt2mt0NZ+E/q6AjJbqsYLYdVRePCUDa2+aXkZEaj/OziRxoj3EMzQ
	jBpkpg==
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com [209.85.219.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g88jpjgvs-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 24 Aug 2026 11:55:32 +0000 (GMT)
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-90c8da50fcfso18713396d6.1
        for <devicetree@vger.kernel.org>; Mon, 24 Aug 2026 04:55:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787572532; x=1788177332; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=qN0ApeMbMDjoyqaP8EXkX4ds4NYn9mbqOQzihITsKB0=;
        b=Z0oCupdjeAOgb9ZsYkzd/1TmBBQxoOHxuQxk0MUb5nSDxdwW18bal05mshqjqfbgfP
         3axbHTA5cENUJ87EIm8Yb3QPx+X5WogLHajMx6JrhbIIhuwCugEutP3yVzDkaHU2aZGN
         CJ8xv5zWYAWnuZQYSi7llX7pNdDPRTgPF9WQYAtdnAQRUgWrB7dMpTPwjkpm+QskzyAv
         XJGTYtchQx/NU/WcNwZ5bW1WjNQeefRA9+K8+zbXQ61uiofDMSZ3eBOvfBgqO68lZYqF
         IpT45dTCHHxucE+520voGkM37677TUWeYsESdYDpn0F1bZm9MNlhxuCNd+7cIGYpqmjR
         Pxcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787572532; x=1788177332;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=qN0ApeMbMDjoyqaP8EXkX4ds4NYn9mbqOQzihITsKB0=;
        b=h00GYR4T1eypVT1Exb/agEtYHsRnadohrz2t30QfmvoaiW+kjNB5O/8dDeVE/3MDwg
         fDRrMHM5kvF6JhSRevuzoTtKqBYaLDHJY2xrgzTYdGzXe9+IpprDpg6PUOvFKyjqhp9B
         DVFdkRNlU8OJw9Y1zTX31U7Z4bIP8En6adBQzSOPxdCuDsE+wr1KyCNRw9LuJWvpFBhV
         IoHUzAFMSlXAvPoFy9XxDssSoCrVqsdHERD50yjIDglTFqptcor6vMzn8euuMS2AaMlg
         engLjAwkC1aX8GtCgWygnHcUACHJPIYnvaqwy07/LqetvU279/xzfPJj/Im2Zp+1SSL5
         AQ1g==
X-Forwarded-Encrypted: i=1; AHgh+Rq1OkGXL5XHmirjlGHgGRRwrY0blT733lurpSVd19O4TcKagU/o0SKaNxU/NrF8VRc/YF4+d1XzLTmb@vger.kernel.org
X-Gm-Message-State: AFuF++kwYc4WCA2VxJ8UWfWBHOAe8J/s07HJ6kguRM4jIXomWo+34iG3
	OoelSqBiFo4TYwujeihxWgWjbgefkSIxQJc0BAkaClhAsaoOO7pBokiUMkfJ6Q0MPF6o+9tQFIQ
	rdcJrauxn2fpIzC03r28H24vq0Cbq+lvIZnrv2SrO23cDhkv5HB/WSha+6Q0E3RkQ
X-Gm-Gg: AR+sD13Gh6Q0ExwgDK/ssnkGdrUrXkCFonh512Z1PXJh8206v92a+cxkYOJL7BxeaWO
	PVL6YQ76MV57OLc19g3xkTdrfvT4+calYUaPJ6ZUAUTNNLDHYhSmkojIe/KabXdvmCu1kgAhe8G
	qS+hXgOfQMRFwkp180x4WFf/082tSG5mwKVy3PStBfK6mxO7RLny7WuFOhoLvQI6j17QPeMBCbQ
	jPCANBfcgOAmkQ+K/sAJRlD7JoYNeZs9cxJUhB0TZKQnTVRRdMnE3I7JY/yTj2+8CyJxmjwp1aQ
	rniKHIz0b0Vzt7k58EKduETcM0Vqrm1HFbme/VtRAop7ug5zDCBQS1hNXZm446jxQWDKkUe+EQU
	xCToxH/qP
X-Received: by 2002:ac8:5a52:0:b0:52b:4bb4:25b9 with SMTP id d75a77b69052e-52e09ca1198mr169777231cf.29.1787572531951;
        Mon, 24 Aug 2026 04:55:31 -0700 (PDT)
X-Received: by 2002:ac8:5a52:0:b0:52b:4bb4:25b9 with SMTP id d75a77b69052e-52e09ca1198mr169776321cf.29.1787572531378;
        Mon, 24 Aug 2026 04:55:31 -0700 (PDT)
Received: from [127.0.1.1] ([188.27.161.240])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c249629563dsm1259990366b.17.2026.08.24.04.55.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 Aug 2026 04:55:30 -0700 (PDT)
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
Date: Mon, 24 Aug 2026 14:54:03 +0300
Subject: [PATCH v3 16/47] clk: qcom: gcc-sar2130p: Tie the CX power domain
 to controller
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260824-qcom-tie-cx-to-gcc-v3-16-f1205a92682b@oss.qualcomm.com>
References: <20260824-qcom-tie-cx-to-gcc-v3-0-f1205a92682b@oss.qualcomm.com>
In-Reply-To: <20260824-qcom-tie-cx-to-gcc-v3-0-f1205a92682b@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>, Stephen Boyd <sboyd@kernel.org>,
        Brian Masney <bmasney+clk@redhat.com>,
        Jerome Brunet <jbrunet+clk@baylibre.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Tengfei Fan <tengfei.fan@oss.qualcomm.com>,
        Jingyi Wang <jingyi.wang@oss.qualcomm.com>,
        Vinod Koul <vkoul@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        Abel Vesa <abel.vesa@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzk@kernel.org>
X-Mailer: b4 0.16-dev-0e65f
X-Developer-Signature: v=1; a=openpgp-sha256; l=785;
 i=abel.vesa@oss.qualcomm.com; h=from:subject:message-id;
 bh=59MxJ74vpUH4TMLPJbZqNrnZ7WIN0Fa1z9MpubowHEg=;
 b=owEBbQKS/ZANAwAKARtfRMkAlRVWAcsmYgBqjDDl6BlMVTHMpJbBNrUzaZqhpMAMXhDy+wTUA
 LQE+TpKXMeJAjMEAAEKAB0WIQRO8+4RTnqPKsqn0bgbX0TJAJUVVgUCaoww5QAKCRAbX0TJAJUV
 Vh1zEACCW2QoqJ402LjeqVsgSKNOg6nGKMIxfKzdQpWVtZundrxQCQfxcR6AFnx88vX+t+2yNco
 wfrlGmziTziT4ZKQXZnyGwk5V6fe2j0XXOvJYtpgREVOuYPKOb/thJEyGrQl8H9U/ceZYxDu36y
 Umq3kbuwFKMZDBsbwISBkr5IYHYmIGElTfsAVswGDGrWNzeU3epOfQT/7eOlsfeHvqzVn2tmycV
 E1gQ9fBpdbSi6EhuQ6w46juReqPTsT1YgI3jATcfqaZetzvAr1coR7JqOaDjub5/QTiXSd4RBld
 CI4EBEdrWwkBQklO81XPXdUS2Q5Aju1LWI5DvaT1miuy5xg69uvQSvm0KITdhrJ5bXHJh4RQOsw
 91AuYYMI8knKrCffTM8petwx7RP1R0hRRHVKHeHdmnd6dyW4elyW/GRfPM/V0YuglJ6RwKCI1E3
 uvSfl5HEV4ZtuFZvV9hY3iLpz250NeRyd1LWMfvsbixPsUZaJw//0t5DwQSGfOxmx+8FCmgwvbq
 sGvdK/lfvpfnvgQvq/SVzdwNmPbnE1+jbcQBPX2Sjq3o82CvErtsepyZgGIqCyNn7fjLyaCPcKz
 BSYnqumer6eNiKOyw1BXTD/KPyWKkQ6E0bUF8/dQdX1ZQrWyaOSBmvMTUjroWW96ZfAc08eOWAO
 h21Znw+MhJuvE4g==
X-Developer-Key: i=abel.vesa@oss.qualcomm.com; a=openpgp;
 fpr=6AFF162D57F4223A8770EF5AF7BF214136F41FAE
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODI0MDA5OSBTYWx0ZWRfX2FfpjxThbN35
 pZpbNSaxLhCsVRFBb1GDXVZfd/+L09RaWW4/ECnQnuR1GIWqmLLrsW+Rt0ftm0tpKf2Jpo9rs8s
 aP6UGu1Pz/pHxkeMxh4IEuIDVgjLrixBDRj/b9COAWubHI/NSxSNlV96P2xvjs45vwgL7m6dzjw
 Nm/LuIrPJVAr+rd3REY/MMri5Iyl8Lsq7QbBEiTAy+SfpDs27gdMezSqixcc95VNY38Lb0vq6iz
 fmtZ8VRbZvQCFYv+bKACP/HM0gNToDI3jNBFTTma2vT7/H6X/Q4FWPk6c/k6yN8agPcz/KJ7T5g
 7BupBCMLFSye0UXZR39QlbpGDZzyICARoNjAC0n1EY45YyG3DxO84wHphHeVxYv7rhnnZP7mFdV
 K8g0bi69kB1YM3xEJhMJSZXFXmw0XFgJ2zQ6bfkOXj/ldw5/eWFkUKP2m6aU1FMUF++l80f15y7
 rzOzuZc8tPySU6LbwWg==
X-Proofpoint-GUID: FBki5B9x6Xxgo5_Fv1BIM4lYUKWjHsBw
X-Proofpoint-Spam-Info: AW1haW4tMjYwODI0MDA5OSBTYWx0ZWRfX+gY+eJ7fzpkY
 AoEomTDYDOiuiU0J3bRToxb3HmyJY3gi7JAEcP8eB+nATAoF6Zqialu/TIgmYV51/SInVHpCJ5i
 XALy1gbrd4SKqQHelilRaU9qFCQxbhM=
X-Authority-Analysis: v=2.4 cv=Xey5Co55 c=1 sm=1 tr=0 ts=6a8c3135 cx=c_pps
 a=7E5Bxpl4vBhpaufnMqZlrw==:117 a=wUpz7uCjLrEXi01cjX+DLw==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=j9QDv7RGPiaZsbg0A-cA:9 a=QEXdDO2ut3YA:10
 a=pJ04lnu7RYOZP9TFuWaZ:22
X-Proofpoint-ORIG-GUID: FBki5B9x6Xxgo5_Fv1BIM4lYUKWjHsBw
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-24_03,2026-08-24_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 adultscore=0 impostorscore=0 spamscore=0
 lowpriorityscore=0 malwarescore=0 phishscore=0 clxscore=1015 bulkscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2608240099

Enable runtime PM for the controller, allowing CX to be powered down
once all GCC consumers have released their clocks and GDSCs.

Signed-off-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
---
 drivers/clk/qcom/gcc-sar2130p.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/clk/qcom/gcc-sar2130p.c b/drivers/clk/qcom/gcc-sar2130p.c
index 475e2cda3618..1a16f9d68bab 100644
--- a/drivers/clk/qcom/gcc-sar2130p.c
+++ b/drivers/clk/qcom/gcc-sar2130p.c
@@ -2308,6 +2308,7 @@ static const struct qcom_cc_desc gcc_sar2130p_desc = {
 	.num_resets = ARRAY_SIZE(gcc_sar2130p_resets),
 	.gdscs = gcc_sar2130p_gdscs,
 	.num_gdscs = ARRAY_SIZE(gcc_sar2130p_gdscs),
+	.use_rpm = true,
 };
 
 static const struct of_device_id gcc_sar2130p_match_table[] = {

-- 
2.54.0

