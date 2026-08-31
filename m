Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 57B5B3F54D3
	for <devicetree@vger.kernel.org>; Mon, 31 Aug 2026 10:03:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788170605; cv=none; b=m1QHD0GEEYHmU22Rm/0B92Ri/zBZFqFPZ3/Vj//Lx0O1VH9SQTaLp+8zEk/oGcVwO2t9TCJ1qm6U8vEYnGO9WWqyK2i4p/MsUUkALnmayOy9IaZnsFuRsKtnga2AEbfdpaCbjehpB3xUNymBj59D7RGQQVVL7OkiyJl1YH4N8a4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788170605; c=relaxed/simple;
	bh=sauhIVUQkKN5CCmBb2DiU9ojVkoyQVbgmp85jdz8/QQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=aXeXiJhDywQbRCHWz2uKWsfStvc03k6s1tsPtloW0cjrR1CEsvQ7VZnRM2CrlH751GLp2ers8FWC4ewslTNBj87dWv1awIVUYMJQ0KgcQ9doLw+0Y1Bwg4gHZGfBxnziHzAcUQfHOljWl+BcT4/pA8EpF1HJPZ6GLk0QrANMGY0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Ne9VZNKb; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=JPCNn/3t; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Ne9VZNKb";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="JPCNn/3t"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67V9AKb53182810
	for <devicetree@vger.kernel.org>; Mon, 31 Aug 2026 10:03:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	1rVM7AVLrz+ksAn2qj1Eoa2oCeOIdrkP6V4Rhur8wHM=; b=Ne9VZNKbshVlVPlD
	AjIdHnTP4HL/jnVyWdNQ7PWQNJuGrYCOk5yMd3/LyCOyRgFSqJkdfKiQLbRv4nON
	S0z1L3F9CiwVqi7eU9FRpB7ldFW/3NB/p83MXAgcl60SxeWG+6DaoWNdVLcsjHGc
	90vTnUaXBk1yHNSMAP0/+RPBf858l2QzdScQpFwM8j4G/ROFKosBr/iyOQ1puSff
	NORV/OH30Ltx1MlS+Ty9NqxDvo4kMn5iLHzSlEHV39Iiydlr2q5UN5A2BqyUrj6V
	gplsfaVNWJN3qgUaoBXOCht3YjiLLO+WFe/eXjngVO/5A5+5ww7ZMEi7PpzbCkkS
	qYQhyA==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gd6rb86uq-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 31 Aug 2026 10:03:23 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-93494527488so549462785a.3
        for <devicetree@vger.kernel.org>; Mon, 31 Aug 2026 03:03:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788170602; x=1788775402; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=1rVM7AVLrz+ksAn2qj1Eoa2oCeOIdrkP6V4Rhur8wHM=;
        b=JPCNn/3t7TqoiFwWE4YtiWbgA9kwvpy7JCWvLxTdXJn5pR+YaDzkmETuPsWvW9OWrn
         ugd8c+5ydS4IWxGuH9PWgexWUH6PJaRg6jE9MxbqecKr92M3rtL/GYaFtOJE5y4cJEF2
         QKKpVWE7GdKwBkmbDhtbXIdFbqRmaqJOHxKtIdZBtPOV6VVE5MW8Sic/PnGrE/KOo22S
         yYYsbgK3VFmse040t4/GBig0kGvZR0G9kK0FjRfKgjIs2VOefxLZaRrztbj5v4RkSDZ3
         mWOCykp3fQZhLb38cjli0g7RT8SNsNLhw/72LCZ10rkiqbJDrKSMJiAHjMKPBeoHA51e
         r+9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788170602; x=1788775402;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=1rVM7AVLrz+ksAn2qj1Eoa2oCeOIdrkP6V4Rhur8wHM=;
        b=RXY8GRl2xdZt82k+/WhdN1U4qQWhNk5PrdqLnQHeJJdaLlPA47iyLF/cp1T15EgzDG
         gG5eAl43wX5I7+Vuw9dd5r83ht8gG7f3xIeb8FRegZwzfNx3DEpTk9Hp2lhw9HAk89WP
         NxNIn1eQpxgPCe9tq+V4DNslhgjdWJRj7IHS1HWOxlTBvlcxABHN3AnctEhwqW47IbR4
         xD8DN64rJlyznXmZw0CpofWWylY6T47pKGJjggNzGbGMNtCW2bF8Dnjob76tlzWc6OOt
         BSigGZd/63xrdTK3Li5ZSAN9aQgP/aXJPQNFV06+8D6shYarxJZncQjC4Xy+MUWG6BqN
         YHAw==
X-Forwarded-Encrypted: i=1; AHgh+RoI35cAK0vjsFT5HTqtS3u7/+B5QGLn36UCXLMu/lgaR7TD9RrXt8mSOFzmJ7UnM11d5GE6Nwu7NNqW@vger.kernel.org
X-Gm-Message-State: AFuF++kc8Gl55LaRZEZYAIU07BajaWaXeQOSjxRRbVJPSdlDox9XESpU
	fgPmdBWRhoyUI15rAb6GaXWSZ+w07hIQmCZnqZsfjzqnMc4NzOAO+tL5iLHLnAzbvESBbPrtQmC
	aU+tAVdZYx/8XFNpPVCGhMLUdjGeNI5uLfZzngO1iCKS2f+acb40qOzzaLpfbRnCT
X-Gm-Gg: AR+sD12fy8vwtsa3Enia8/AfXlRLqvGuF00u9R47V71yreBy05J2MO59YjJXyw+Bwbo
	uiGwRjOKx9ZqKTW1wF7d42e9tQTPkPW2o+zPM9XgpnabErKKSeId9TJ31IvmYlXXKNoPhU6F67X
	EMsemj8NoH0bEaiKSh/ApPZEnbuf5CgDXd7JxveWGKbGaLwSwjIOhp0t4alxT28Uy0C86hzNWXa
	ehapFt4UQi8adrBCAW3FkQcMCOgEfSCHI8NyqvH6MGiTJOAezCIB5dc4pYmmC3KvObNx/xm1aZ7
	T1ua2JVqZ2acZpP9D4jy+0or4E7BndIqkUV9GCgFtCvlduGjEpEQxRggQqevMAfMFc21HMA+rIZ
	Zm8CHpg==
X-Received: by 2002:ae9:f104:0:b0:939:116c:2f5e with SMTP id af79cd13be357-939138630e8mr2303831385a.19.1788170602479;
        Mon, 31 Aug 2026 03:03:22 -0700 (PDT)
X-Received: by 2002:ae9:f104:0:b0:939:116c:2f5e with SMTP id af79cd13be357-939138630e8mr2303822585a.19.1788170601717;
        Mon, 31 Aug 2026 03:03:21 -0700 (PDT)
Received: from [127.0.1.1] ([86.121.170.13])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49b9281772bsm131001555e9.1.2026.08.31.03.03.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 31 Aug 2026 03:03:19 -0700 (PDT)
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
Date: Mon, 31 Aug 2026 12:54:42 +0300
Subject: [PATCH 2/9] arm64: dts: qcom: x1e001de-devkit: Mark the EC reset
 gpio as reserved
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260831-dts-qcom-hamoa-reserve-ec-reset-gpio-v1-2-5b202de8c74f@oss.qualcomm.com>
References: <20260831-dts-qcom-hamoa-reserve-ec-reset-gpio-v1-0-5b202de8c74f@oss.qualcomm.com>
In-Reply-To: <20260831-dts-qcom-hamoa-reserve-ec-reset-gpio-v1-0-5b202de8c74f@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Sibi Sankar <sibi.sankar@oss.qualcomm.com>,
        Abel Vesa <abelvesa@kernel.org>,
        Rajendra Nayak <quic_rjendra@quicinc.com>,
        Marc Zyngier <maz@kernel.org>,
        Aleksandrs Vinarskis <alex.vinarskis@gmail.com>,
        Konstantin Shabanov <mail@etehtsea.me>,
        Srinivas Kandagatla <srini@kernel.org>,
        Georg Gottleuber <ggo@tuxedocomputers.com>,
        Ettore Chimenti <ettore.chimenti@linaro.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Konrad Dybcio <quic_kdybcio@quicinc.com>,
        Abel Vesa <abel.vesa@oss.qualcomm.com>
X-Mailer: b4 0.16-dev-0e65f
X-Developer-Signature: v=1; a=openpgp-sha256; l=918;
 i=abel.vesa@oss.qualcomm.com; h=from:subject:message-id;
 bh=sauhIVUQkKN5CCmBb2DiU9ojVkoyQVbgmp85jdz8/QQ=;
 b=owEBbQKS/ZANAwAKARtfRMkAlRVWAcsmYgBqlVABL0lInaEv7U+q2FrsYdLSN+6fodL2Z7e1s
 EbpvRtZpsGJAjMEAAEKAB0WIQRO8+4RTnqPKsqn0bgbX0TJAJUVVgUCapVQAQAKCRAbX0TJAJUV
 VugtD/9U0XJlBhptO+t3UuiPKZ0ggY1zpTnVmqGjdyWKqihddVHyYnj2JWHknYoM7HRJMUNTWtO
 unuh/wFIIk4j/7G0Wsjm0HC6D3oryDveJCRlNKc5h7mPeCaVHNcLsT8q4r6hRPZ62ud9Z07Q90k
 ky+J0VMzu6a1ZiM0i2kjV70LtFYRH27SlGNVD2bNh9sUxYUwmIAPCuNjl0YCxdrkWzD7p8mZ1CF
 2NUcNUDVaboN4mHJmBo3qgaYqoBYPJjJ4DSIsfWClYhQCsL5HLDClQ1X+Wg9D1XfpG0/LxYRwmK
 PfhRuueNSXrK9OSupGTxU94yBTnGEIhBYB5KJ2yn8EPdMP6siXS35VOB306/KxNtztSgE8DPhf7
 3bMGXxYz7SavKbHWfvkjuceeV/pmyFEG2U20wcFRaqssOVLkybpMe0j0rce6FAUffCpSIot5I5i
 AZRiYVDKiuM76HWhkPTxlAzdnTMR964xd0wsGsMXzKTxDxLUIDTvI+ujRMEniYpxhWLNmyt1UUE
 b7dFDzrFY7qj8ox5vJpO+nY3qbvJeOc/fsFgAZ/+YV9JNiKCln0qRONTDnorFb33NqzL0YN9gwF
 uoGLCVc93t4xlkCOQIIGfRA/jBxFM+Apb+bvdBtCMagdYbp1WPbXetN+BKbwTKKeXx66jM6ZgL7
 q5s8FqoGAMNMixQ==
X-Developer-Key: i=abel.vesa@oss.qualcomm.com; a=openpgp;
 fpr=6AFF162D57F4223A8770EF5AF7BF214136F41FAE
X-Proofpoint-ORIG-GUID: Xov4_Nsfbgf1GwbiL5rZppCvN8Y03HpS
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODMxMDA4NiBTYWx0ZWRfX6OA605PeYfzL
 M5BYgR5h3n+ppRYJlOx4o4JCXfAXbNd47Q0LZlvi50Rl2BiOZxPonbvDHRfaDknOZgWxyOmNAiB
 ubWTcs2pKwlhjOylclgJIlKYQYnF8BUfzf50tPb8AU9Opl/nQH7pU/ZLZYuO8ksByKuicC48LCD
 vdEizDjJfDw02bTR0IjLwupEMvWVNfQ3Rbiwzb4STceMgJTYWKRLv4gQqYOQi7VD3stbcWBvRui
 tauuFPl8xC3ytzse5xKlN9eWGvA75+TrM07OiZKrusxPl7BTs4t9rOTh36KfKXvW9+PLdd9UTKH
 JDEx7hPShYIKmPlYgie4HIVAamzw0mkrzTIZOiPv1uV0XQusZmPhMUjgAWiHArOqvk+jAsnHuRP
 qt+6EImi1upGK4I+XTAsdJiUG0hUsXdXgzE4JX306uPaQOdhimKDj4dQSuRRUoDVtFKST6/RmJU
 L4fa7JQbmtfXbjLx6hA==
X-Proofpoint-GUID: Xov4_Nsfbgf1GwbiL5rZppCvN8Y03HpS
X-Proofpoint-Spam-Info: AW1haW4tMjYwODMxMDA4NiBTYWx0ZWRfX+swbCBE9PwYh
 mIkvU2B5EDwAtMJll2V2ZidNJlz/u+/E2nL9KN0iLpqm8ZZkzunCk6Im8J5msbQkrXbZSF+qFNf
 +0ad428LmGsGjd2WpkoKvAE5D8X9zU4=
X-Authority-Analysis: v=2.4 cv=d/fFDxjE c=1 sm=1 tr=0 ts=6a95516b cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=clBUptZa5v5FR042Ey+sjA==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=gnkErBHEmTjFWuL_1-UA:9 a=QEXdDO2ut3YA:10
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-31_03,2026-08-27_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 lowpriorityscore=0 suspectscore=0 impostorscore=0 spamscore=0
 phishscore=0 priorityscore=1501 clxscore=1015 adultscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608310086

GPIO 65 from TLMM is used by the embedded controller as its reset line.
Reserve it to prevent Linux from requesting or reconfiguring it.

Fixes: 7b8a31e82b87 ("arm64: dts: qcom: Add X1E001DE Snapdragon Devkit for Windows")
Signed-off-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/x1e001de-devkit.dts | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/x1e001de-devkit.dts b/arch/arm64/boot/dts/qcom/x1e001de-devkit.dts
index be1a8ac8c699..3ba45a7884a2 100644
--- a/arch/arm64/boot/dts/qcom/x1e001de-devkit.dts
+++ b/arch/arm64/boot/dts/qcom/x1e001de-devkit.dts
@@ -1194,7 +1194,8 @@ wcd_tx: codec@0,3 {
 };
 
 &tlmm {
-	gpio-reserved-ranges = <44 4>; /* SPI (TPM) */
+	gpio-reserved-ranges = <44 4>, /* SPI (TPM) */
+			       <65 1>; /* EC reset */
 
 	eusb3_reset_n: eusb3-reset-n-state {
 		pins = "gpio6";

-- 
2.54.0

