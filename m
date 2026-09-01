Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D4852472541
	for <devicetree@vger.kernel.org>; Tue,  1 Sep 2026 08:07:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788250073; cv=none; b=BwryZM/iRuvdfpKyaKyr2TFZffs/JOC6hVelprEE0UAcOK4BJzbroSrNMPPx/v+zLqlM67bP3+Xt+d2EZr3W76nSP0PHclkEyzY/F1ik7iyBRFmO+yrNwLmFI5sYRvnSHWV5sjFvhR0zA0CzRI8NAA+ZCevjJLnTgDPQBz8klLg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788250073; c=relaxed/simple;
	bh=XDmFQzdLBpSfWgObm1ICDjopUWVJ+W6chK7ycRQ3FR0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=XUsw8YDXOIR80/JZkhTo5TZJMSCQR1vCP7Gpf0e8npzYChP0Nweh6EUxbF9hCY8HndUvjaZDFwfDImUv8TvyuAtGhJ45IQvZJv1e1sko7oC2Zna4Gt9FnWq1+uvFFKs1AVN5bL92P5R9Rf9bHOFgac+ZN3hs5o2THHJtDxHhQnw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=jQ7HP/zd; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=FUKODyFY; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="jQ7HP/zd";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="FUKODyFY"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68179ROI2322014
	for <devicetree@vger.kernel.org>; Tue, 1 Sep 2026 08:07:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	2LxwHPkUxk2hXUWf5pdK4YPlLdQ5GGI7w4zMMH7NT68=; b=jQ7HP/zdxuXBsCI0
	iPrjVjh7JrzUXWKagUdvnU8Puzsqdy7A8nkEWCyiZraEKpLONnu6E/oArJxG+r0I
	NI/CWSzCXH3bCxjVQvq9Cxm3Fa++iUSFx0yZA8q57sMN7CBN3d4M6F40sVi0gAZe
	e3u4h9+wYkaGfYt7TYY82V+YkoCjDwxBpK7u2z/JrRqFee/zc1XPjSGVLrXsHLv5
	6kNpE1ufPVj7Sq0rGPmNqGZEa+o+r2BGv3JpWfAFLK7ROQps2BhdxiohlnzwCkxC
	aga/VbTKwqQakQ5z5b/Q1YtU981bmJc2tzQFsrUaTQLpkFvjr8Iax4UFIzvBpK3p
	pZuBaA==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gdfchau3j-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 01 Sep 2026 08:07:50 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-93771aa0379so1202370285a.1
        for <devicetree@vger.kernel.org>; Tue, 01 Sep 2026 01:07:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788250070; x=1788854870; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=2LxwHPkUxk2hXUWf5pdK4YPlLdQ5GGI7w4zMMH7NT68=;
        b=FUKODyFYv0oSs6o8Udc386BIUFedGVrMo7XEGQoJzX3BytPYLJhcIU/AJ8sZHMB98N
         PoQDVtR8AtncJ1TJCR9M3Vjk7+WqvgtwcUDMAkCWM6Zozw1HKu6iX5uVtskcUwUAdHnh
         GNiHB13ZYZUvKdLBEHuXkLzUpps1NoVOzW0EGhn2ObU1XHf+97zO8RT328s6QPAC5CdI
         Z3qmhozoepU1PSoE1SJziKFl1bVokjY85QrHFqdtUl19r2njnyVsGHwxnl5md/hYPq50
         ZfobKuMx4CXHJgln0ItFAPFGJO9JTnkt0OOpLjMSYf1f+HgVyzZCsnQC3WPx0EyGPu2g
         YCLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788250070; x=1788854870;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=2LxwHPkUxk2hXUWf5pdK4YPlLdQ5GGI7w4zMMH7NT68=;
        b=FlZbnEbW9cXjgz2FGbDnIzVO9bWRJAwqM5wOQ2s4BIB5zYAH1hurR5IxDpaiVmIMEf
         pAqEyHsiyM9jnInl/mZOeqiQ7agHxPLH751lhIg6b6AY55OhaakQd8Wf+yu37UAesAwv
         vXgn7vL9UWKZ7fkEt7E3M9C9A1UuVw2KndDri0hKxXhUnXv6GF83X86eakXsF+coTOnB
         byw5LGdarlvIUveQHVxXOb5YWasnhD16TxnHhNfvcjTiiqP7viboInd+C73EiS1D8xWP
         MBkvMKU/RGgH0T8BirHto3IgmgODxRXws5bqG3qcY5v7JLpVYSz2ZtUn5vzVY85Nh1va
         Anqg==
X-Forwarded-Encrypted: i=1; AHgh+Rokj9BbXSuFjEWmbfiRHYFQIjYqwvokDzJmLpBm1kt8e20zDPqUeWN4Su3a4hrmtH4I0UngPaXhcdX5@vger.kernel.org
X-Gm-Message-State: AFuF++k+QA9PplWtod7CQBgil7Ha3AgZkGvjusKZBAy3MpwrBdrGeJSk
	48StVRVKumBhVLEBrYD9MxvrK7Qn4aCks0sERqQXxeaTYjvXgwTQrlauwOKac1LUPD8octbFC2t
	/2N+X01d2JnGvKzRY787f7KoDR4zvJJC+5vWF0RDnd8t2hgBNO2439k4P0eT2uPpV
X-Gm-Gg: AR+sD13foVfFJqe5TWuf4yeny2lqGm0NgGwG/69HwcIvugHFYym1/RX8EJMgEvLbQUN
	n+PqMPYSUL0RbBMTXiJkMex2+HWunCnWRV0Fqz7PMIjPTohHq2xYgwlWKYURy3YEiZ/2zcsEUgg
	NnPfewTnPsmTzKyIWgJSrg0IA3FyqWxgR1nllFYHJh9uSn45OcHKSpmFGi3cbE6+RulYEkYhoMY
	rRvsTna2ocS6XmBrmHT3VxNMlSNc/gogk/16zdWCDxxE02agYHcJ/1hukBJVCPoZP1Owk9fBoAx
	e6r0t60b8/9e0BL9lDqrYd6/wH1wPRanT37mQgmCgTpJzSxYfwL26EzLFrv2jxqGT8vUxOoSnX7
	09OT3lKp8
X-Received: by 2002:a05:620a:2585:b0:939:10dd:9c09 with SMTP id af79cd13be357-93948132485mr810370485a.32.1788250070071;
        Tue, 01 Sep 2026 01:07:50 -0700 (PDT)
X-Received: by 2002:a05:620a:2585:b0:939:10dd:9c09 with SMTP id af79cd13be357-93948132485mr810364585a.32.1788250069492;
        Tue, 01 Sep 2026 01:07:49 -0700 (PDT)
Received: from [127.0.1.1] ([86.121.170.178])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48442d3d2eesm3267776f8f.15.2026.09.01.01.07.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Sep 2026 01:07:48 -0700 (PDT)
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
Date: Tue, 01 Sep 2026 11:07:05 +0300
Subject: [PATCH v2 08/16] arm64: dts: qcom: microsoft-romulus: Mark the EC
 reset gpio as reserved
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260901-dts-qcom-hamoa-reserve-ec-reset-gpio-v2-8-f4ab7e4bb75d@oss.qualcomm.com>
References: <20260901-dts-qcom-hamoa-reserve-ec-reset-gpio-v2-0-f4ab7e4bb75d@oss.qualcomm.com>
In-Reply-To: <20260901-dts-qcom-hamoa-reserve-ec-reset-gpio-v2-0-f4ab7e4bb75d@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Rajendra Nayak <quic_rjendra@quicinc.com>,
        Abel Vesa <abelvesa@kernel.org>,
        Sibi Sankar <sibi.sankar@oss.qualcomm.com>,
        Marc Zyngier <maz@kernel.org>,
        Aleksandrs Vinarskis <alex.vinarskis@gmail.com>,
        Konstantin Shabanov <mail@etehtsea.me>,
        Srinivas Kandagatla <srini@kernel.org>,
        Ettore Chimenti <ettore.chimenti@linaro.org>,
        Georg Gottleuber <ggo@tuxedocomputers.com>,
        Xilin Wu <wuxilin123@gmail.com>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Val Packett <val@packett.cool>,
        Laurentiu Tudor <laurentiu.tudor1@dell.com>,
        Jens Glathe <jens.glathe@oldschoolsolutions.biz>,
        Dale Whinham <daleyo@gmail.com>,
        =?utf-8?q?J=C3=A9r=C3=B4me_de_Bretagne?= <jerome.debretagne@gmail.com>,
        Abel Vesa <abel.vesa@oss.qualcomm.com>,
        Harrison Vanderbyl <harrison.vanderbyl@gmail.com>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Konrad Dybcio <quic_kdybcio@quicinc.com>
X-Mailer: b4 0.16-dev-0e65f
X-Developer-Signature: v=1; a=openpgp-sha256; l=1082;
 i=abel.vesa@oss.qualcomm.com; h=from:subject:message-id;
 bh=XDmFQzdLBpSfWgObm1ICDjopUWVJ+W6chK7ycRQ3FR0=;
 b=owEBbQKS/ZANAwAKARtfRMkAlRVWAcsmYgBqloey7v7Cjf+8HBK9cHudRgThQP3P4yNa4RmPJ
 fhJZaVbDxqJAjMEAAEKAB0WIQRO8+4RTnqPKsqn0bgbX0TJAJUVVgUCapaHsgAKCRAbX0TJAJUV
 VkvYEACuwzphqQoD9Vj2HmtKJzv5rbvnN63b4HyM5kSLN1Ab6hnJOObHsHGGY2+u9VZ3dIkPouG
 HNR7We/OBbt6PkyYGYHjvw5JpA8a7mMIv3QmdWNlMpKlntx5i1uUMsMATCQvkAT/8taN0QPu+Lo
 rjMbsooz0yCB+VCmbnpVk4uov1o7DHVVX9/rV7rTFHi4V9WmBOMwHzkPBGXNsImViasFzg/wNHt
 KYN1I4iZrpGD64xGZhdjKj5HfZaIcvovZaZdKhLgiSV8hI6sXtsLfVLfmk2T62dJOaQ/GjgSgnX
 Tp1yDyTMaoY2+Rk0mZZlOwSeMc28zZ2kLuCj9R8Qb+n5U1NZSeAMHXfhgkEVvZWDzt2hunFYtlT
 k90IV6cbe4Wbr7SxZ2QpKsa7qk3xZYLAqmJVgnxVV2gbydyMEyKwmZDUv1c6sFUMoa1tKJFqDYy
 JU4DVjc+ckUz/o0Jry3z5SK8c4cwnywlztGhqbluUdG+kbEcmrPoyD60mD8wNlzkf2cDcGs0p5g
 ipuh3k7zqscL4ar17b4BiTJnmcVQiwAZ6rdVLArvtOCXdbkKzl5HxhAU/+JNLT97g4oU4xuJETG
 Jt3NOiKw3FxNFWDTIdKDgPBvZG79S02O4HseQrKxWYq8OWsAIFHOau2T9fsd3lbiQVtUQvjWCp5
 Vlz8nrBjSZe5+Fg==
X-Developer-Key: i=abel.vesa@oss.qualcomm.com; a=openpgp;
 fpr=6AFF162D57F4223A8770EF5AF7BF214136F41FAE
X-Proofpoint-ORIG-GUID: LxJOXGarQvLX-iLZISjnIeEaVV-XDgcO
X-Authority-Analysis: v=2.4 cv=G9Ms1dk5 c=1 sm=1 tr=0 ts=6a9687d6 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=G5ilVN+faPP2Ze1SHB4iFQ==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=EUspDBNiAAAA:8 a=UFfQ5ueM2aPJ8qDrgdoA:9 a=QEXdDO2ut3YA:10
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-GUID: LxJOXGarQvLX-iLZISjnIeEaVV-XDgcO
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTAxMDA3MSBTYWx0ZWRfX4nK7otqUS+mb
 AAp69Ivoyk1NAcE2jSN+wEna+s8YE1R3MG4u3PUxYXXl/R5Py/ETQXMrhq9OgnyszM5kn+JJhTR
 RS9tSJM8BtVJx47OvatOQyQdC1XMBVU=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTAxMDA3MSBTYWx0ZWRfXyR2r0lZ4YpxB
 tmzub5vvoi7I31IRpTUP092B5uKjFReI4hu/cmHWQSnuROq17En5VtcY5J0XqXl9mjyO4+7wyUH
 PCbsC+gj/TVlnEv6c6ErZBJsdKNFEXvk0QnvDB0BnvCs0kjmSXavkO4EqHz4r6kfppqtWuHvIBo
 W9XnhwsO16yFUGRTLCrdwmLJVX9qWlcQPm8Gk/bBpA+I5gHZt1272dKgrF0lY+vhAmta+vZk2wO
 OSfuyBh9i6yTeyBUajZ1y9BwIYPLoMPP/s6YaKWQRcj5UJjm1rm5lxuJA3sI3MmB+zkcruG3aoc
 qqb3hp0H8hfMAxIlM4vT7Ak1shvoQSmDlxHbou6lBQd1vY6udoSqcD+4X7BGcFy8gH5C6GoJK/3
 XzxqfVDJ5TGH9fBHRkzNUPBOcHY00M80Z5BfRAA4AslRcGhmEQZEiHBb9TMkcWt781y55H0e1Pu
 XrIrg07duav7v62m0Tw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-01_02,2026-08-31_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 suspectscore=0 adultscore=0 phishscore=0 malwarescore=0
 impostorscore=0 spamscore=0 bulkscore=0 clxscore=1015 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2609010071

GPIO 65 from TLMM is used by the embedded controller as its reset line.

On some devices, toggling the embedded controller reset line makes the
device not power up at all, unless the battery is unplugged.

So reserve it in order to prevent Linux from requesting or
reconfiguring it.

Fixes: 09d77be56093 ("arm64: dts: qcom: Add support for X1-based Surface Laptop 7 devices")
Signed-off-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/x1e80100-microsoft-romulus.dtsi | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/boot/dts/qcom/x1e80100-microsoft-romulus.dtsi b/arch/arm64/boot/dts/qcom/x1e80100-microsoft-romulus.dtsi
index 13d0f09e0c2a..bc684c295b89 100644
--- a/arch/arm64/boot/dts/qcom/x1e80100-microsoft-romulus.dtsi
+++ b/arch/arm64/boot/dts/qcom/x1e80100-microsoft-romulus.dtsi
@@ -1324,6 +1324,7 @@ wcd_tx: codec@0,3 {
 
 &tlmm {
 	gpio-reserved-ranges = <44 4>, /* SPI (TPM) */
+			       <65 1>, /* EC reset */
 			       <238 1>; /* UFS Reset */
 
 	hall_int_n_default: hall-int-n-state {

-- 
2.54.0

