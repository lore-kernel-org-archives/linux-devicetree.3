Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 23EA5522F0F
	for <devicetree@vger.kernel.org>; Tue, 22 Sep 2026 07:51:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790063517; cv=none; b=QlC/lJH/JYTuoYqLAQmMkuelYudnFu8gMQzORWKvhWqDyZSyN9nWDiRuQmSN1vM6eq983FYMiO0AN7XLZmAEkiX1LESj9i7uihjhyOTF6jZV2J1n+c2zNKMuL4h5TefRWnhulwLT5cNf/C2Yn85ECHyNfk9ac31Vhb60BeIbKUc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790063517; c=relaxed/simple;
	bh=EQgqstv9o5vUPvoyrR7USbB+8WZL00cqFkFyvb3/MfA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=CAdkvkV5G6a6CmlvDagoJ9VIE+zXEqD531uGiLqMqv30tzEQnuVpyGg9pONuQpt+qZYlqfde3WXwPiD7eGW70vKcnEJ2/eghQgWCC0IhouXVlJksLut15S++IkxYEv5va/QGy9w5pz+YvGQoxJ1ltxpCnAeQNilZz4m31mSAUzs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=bMZPqB8X; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=JlDI7LV0; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="bMZPqB8X";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="JlDI7LV0"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68M71PCx2165616
	for <devicetree@vger.kernel.org>; Tue, 22 Sep 2026 07:51:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	+CIh4tIaFqUrLEgvjrXOO+YyulO4/MZfSeRcQ+J120g=; b=bMZPqB8XLcv09FSi
	kHF2qghA+rqaYbqRamvdRWkzR5fQO0I4QcrN1MvO4QTSv7wwybilgiInLRUaNSSx
	dIT4/z3gpM/uLm44Pra0gInjcWJtqPLtLjnUALnk//Zq+CibB+f5OO/ezkAR2a9w
	jn4zKO6jZJrvf8Zsdb86qfTfkWIOd3kbRC3jT6uB9ZYgAePZATUpb1Tbbvu914Dg
	hfWly3oZK/C2pyTI1hiACmIFAVi2J+HK8WNAACZnezeX8M5LngS/xhQF8e9wcgjO
	LalZS+JjWBdMAFozFC7B8viQcnYCSctviFFHyYmCzK9d+LOjXrO0zbBO0SDY4fNl
	FxOHmQ==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gu8xetw4a-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 22 Sep 2026 07:51:37 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-93a01d1d1b6so580818285a.1
        for <devicetree@vger.kernel.org>; Tue, 22 Sep 2026 00:51:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790063496; x=1790668296; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=+CIh4tIaFqUrLEgvjrXOO+YyulO4/MZfSeRcQ+J120g=;
        b=JlDI7LV0k7QvhLhdI5KOl3J+R1Rbx0o2bGPk5B2NDgfgFis/QgYJ4pQ5q0Rzl8KGPe
         Z9pJ6+7JrYXgqynMh7QxAD+Uacfxqz3QTyqEVxq5xmSkn3gN5HIp8VrqNHXUfE4aP/R5
         yez9WaPmf5+QF7su/skYcwvT44Xn7w1VRDvW32mX4DgKMflU0T/PV6xDG5VDLsDZi1YU
         3+btVme3gbHutFsRXCHZhCbVrqnZ9a/xFDaYyaUkQUueNcIhebo0l9SRzayWqjYvUNoT
         5NzP4qsonlDmKQKTCReYYXWlQJHmhQ8Zz/SMDBgO/+MMHrllMwes1t3bkLt+YM+HzmEw
         ZAyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790063496; x=1790668296;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=+CIh4tIaFqUrLEgvjrXOO+YyulO4/MZfSeRcQ+J120g=;
        b=zYR+6hqLfhI2sfFnd6pOQH0k+1BoYasY/RBRWSY1byaHxUE3mBMJt7pNa0r6wOl64P
         DBdhu14Jfz1OODDvDK7rKD73w9vSmBl2OEY7BnreXV1f7hEAdJijgV3x/sDewde3j+Qj
         vOEiZHzV+pr7S5EPMb/jEpyTQF0bg986LaCFCe5rb4cxO2/bEZOjr04bIUFwHhJL/oB3
         Zgk7QwMDygJYh8qhmbkHadx3fJspK80snu+JyU6XyRS5CgRs5cUWD1nUIow0iew6EcfR
         dv9XfZIUYPbjexwMob4jnqvjBezmLCeEzpXsq6IH7jCxkfh55blISnw6pjrRhlga5DYh
         /RIA==
X-Forwarded-Encrypted: i=1; AKwUvBySXVvwqvqq38F1mgya0MWJKqG2tz1v55Nc1WteL5IMEWd/khKzrhewrsgzIljOgaqxNkn6ApE6RXB1@vger.kernel.org
X-Gm-Message-State: AFuF++mjM/+Y7qcDIJT27xkpEhH07zh7mcwxqwfrUU+kW8BDBgUNsjZg
	L/b7s96YSGvOgbYMvN+NXy4tJMaR2tUUkGb8w4b6mDp8XWaaYoA4PNhtNadNrmw2S6aXyAFHEky
	Ca8HE669z9L4AXZ8ib2AeLMWsedHYnsUpsvBI0Rz0ddhTCInRy1tC/izvZlD62PaK
X-Gm-Gg: AYBFou3lEURNe5IQMig8QvFPvwhc98czVTcNf20Ehs2fHe5pq4LIrxvcVIYICTsKhO3
	EhMQGxC1CQqIKTt1KAkKCwn1o/h4Qg6T0KjMeBOHGzB30shEED3ZAggmMNNGUcQH5GnOrgVAJsZ
	4w5FzkALb3SpGcsD5I5dyUCWB/n0MJPPUyAKM5VO1sYBNtuZr76sNNRcQ+1XJnC5HPjrOhj2efw
	CC2mFp7lyLky1j0oiSfmQRIJzH5U5Xr/6OcV2yyxHUjTwSqjY+NasnfNqKXDnaIdj48FUGr2n6H
	JlCZ1DjpwamU/Fc+5/EGtqeamgqhYuGescqOovCSgf9MnLzLg1vM8AcJwUaPfO8x+8D+AGXSPoP
	smKegzROh
X-Received: by 2002:a05:620a:2949:b0:93b:d7a0:d9dd with SMTP id af79cd13be357-93c19a67345mr236499385a.55.1790063496269;
        Tue, 22 Sep 2026 00:51:36 -0700 (PDT)
X-Received: by 2002:a05:620a:2949:b0:93b:d7a0:d9dd with SMTP id af79cd13be357-93c19a67345mr236495285a.55.1790063495756;
        Tue, 22 Sep 2026 00:51:35 -0700 (PDT)
Received: from [127.0.1.1] ([86.121.170.232])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48862789080sm3046925f8f.28.2026.09.22.00.51.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Sep 2026 00:51:35 -0700 (PDT)
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
Date: Tue, 22 Sep 2026 10:51:12 +0300
Subject: [PATCH v3 03/13] arm64: dts: qcom: x1e78100-t14s: Mark the EC
 reset gpio as reserved
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260922-dts-qcom-hamoa-reserve-ec-reset-gpio-v3-3-fde7f8a53382@oss.qualcomm.com>
References: <20260922-dts-qcom-hamoa-reserve-ec-reset-gpio-v3-0-fde7f8a53382@oss.qualcomm.com>
In-Reply-To: <20260922-dts-qcom-hamoa-reserve-ec-reset-gpio-v3-0-fde7f8a53382@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1111;
 i=abel.vesa@oss.qualcomm.com; h=from:subject:message-id;
 bh=EQgqstv9o5vUPvoyrR7USbB+8WZL00cqFkFyvb3/MfA=;
 b=owEBbQKS/ZANAwAKARtfRMkAlRVWAcsmYgBqsjN0DO2HECJJrAYgNrLEuaFtDNg83a2Q8UDwO
 6bvfn1xu5qJAjMEAAEKAB0WIQRO8+4RTnqPKsqn0bgbX0TJAJUVVgUCarIzdAAKCRAbX0TJAJUV
 VkpDEACB3pGE5ImWDk6cbxKS8+QqqyBQTsxJLavY1womKY6fhp7+PX6D+s/0PF1zX2F53B+3KPD
 yw/9EpA1imRupW+o0qSV1w+bdSitNOnqTWtmXD3WfhHE501uS+0W+lO4S4tK0Vi7fLWKKQdVefO
 jq3VeVt78QsMLvr9ZbnP4jj8YwerXADV2LtRQ/dtYMYah0rmcXD2tETUt0a8mTfyvAlTW16cRRV
 WJjowQpvbg0rbdmr4z+w7kXjILeObgExSYHjGPx3C3CQfErRrYOBHaqo6VQkBepG73MANsP8cCu
 Qb5aZ9NcT+z3gJHwiReUnTNJWb9rmSLNoDe+HHpDfUmDA8qVuLKssKjMn0GH9LqXYH8XvH/HNwH
 +LNCklMmGwrjDznzUz0doXIqTm7yAjE7zPwh6BasmtuKyfKqquY0i/TayfQc+CEDjnu0sDIXz1k
 L9u/6md+iqT60btemaFp2G+lQeX8WYY3SbVxSlZsyvVKBz4QuDQp/tJb3jpTSclc7KDuhMK1Kr6
 EmX5HXmqqoTSR8rqMlHqw4Sgx3uJrdqdpArcdf/7VLK+/HQb42G3aZzsBAm9FR6lNuhDSyrmxCO
 Zwu1oHfkF5FFVsH+H1Ufi4UEDZq9vup0wxznE60nHu3DrnUYGRgsfyOIb4/HoJ79cDs+CMt5Vge
 b3KdoxHQtd86Ezg==
X-Developer-Key: i=abel.vesa@oss.qualcomm.com; a=openpgp;
 fpr=6AFF162D57F4223A8770EF5AF7BF214136F41FAE
X-Proofpoint-ORIG-GUID: VkRg1hPmhxiiNIBZ_4beHGCtsexjOXbv
X-Authority-Analysis: v=2.4 cv=PZhqFShd c=1 sm=1 tr=0 ts=6ab23389 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=po8fGBi+ks8MzcVQGuqtFQ==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=UFfQ5ueM2aPJ8qDrgdoA:9 a=QEXdDO2ut3YA:10
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-GUID: VkRg1hPmhxiiNIBZ_4beHGCtsexjOXbv
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTIyMDExMSBTYWx0ZWRfXyCkbstcKd0Q+
 OCP+37GczqFPoh3pXTBq/Lq6+WP0Z5dyOkIUqpcKjvB5bXNLAHr0gx1SKeTUGHYhkXfpKFhg5zS
 VxZJiI18zzJIIs+586ZY/h6IJXj0Z5JG8rRgmk4+RMbABOGpLHqgrhiJglKSH30D/9MDpJGFik2
 hmB6dH6ExoLIMP5UN7FrjFF9UfVS23KGRI1DTDnIEfRp+cbUAWP6a0haqGi39aQqLrN924RFrKO
 Q25C+Vb2b44lrYP9Je+ommXMpox+IRgJQtiQgrP4vkCFpk1pyNkFlk6XFVaAC0TAtgwVKL1X44R
 dorjvs08YnrkmGUPWbRdLwJhXrvyq4qRwIg9/a+kKDN4fwtXFjIeXtvhc4V0JmzDNg9h1QAatOl
 pyXcz2eyjf/ZfVI11pcP+yVu7VI2qAOdyEgDT/9LjPlQ7MUT8UXcEiy0Sk2mT3CM4RAibAeM5cc
 fqZ+ReYwXPHbLCBYdpg==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTIyMDExMSBTYWx0ZWRfXzQYfbtNsyfdD
 xUqSOXKwSGmTMbVU5bYC6Sku/bIPS1h1vWnRqEFDTC7zWDUD4BwDYmsuG6YzXZqZzAJnHSro21K
 0kUZHuqtd9ll9RbBzMRSJeqaBfzW0vQ=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-21_07,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 malwarescore=0 spamscore=0 impostorscore=0 priorityscore=1501
 lowpriorityscore=0 suspectscore=0 bulkscore=0 phishscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609220111

GPIO 65 from TLMM is used by the embedded controller as its reset line.

On some devices, toggling the embedded controller reset line makes the
device not power up at all, unless the battery is unplugged.

So reserve it in order to prevent Linux from requesting or
reconfiguring it.

Fixes: 7d1cbe2f4985 ("arm64: dts: qcom: Add X1E78100 ThinkPad T14s Gen 6")
Signed-off-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/x1e78100-lenovo-thinkpad-t14s.dtsi | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/boot/dts/qcom/x1e78100-lenovo-thinkpad-t14s.dtsi b/arch/arm64/boot/dts/qcom/x1e78100-lenovo-thinkpad-t14s.dtsi
index 75ad74bcb042..93c7e3a02041 100644
--- a/arch/arm64/boot/dts/qcom/x1e78100-lenovo-thinkpad-t14s.dtsi
+++ b/arch/arm64/boot/dts/qcom/x1e78100-lenovo-thinkpad-t14s.dtsi
@@ -1406,6 +1406,7 @@ &tcsr {
 &tlmm {
 	gpio-reserved-ranges = <34 2>, /* Unused */
 			       <44 4>, /* SPI (TPM) */
+			       <65 1>, /* EC reset */
 			       <72 2>, /* Secure EC I2C connection (?) */
 			       <238 1>; /* UFS Reset */
 

-- 
2.54.0

