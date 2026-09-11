Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6CCC634F24E
	for <devicetree@vger.kernel.org>; Fri, 11 Sep 2026 06:49:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789109356; cv=none; b=R+HMTsBbL7Vd9NUPunzkWhDMkkYc5tq0+cms5l7AQg6MdpHTqFz9Z0SUl1c6k2VivymWXgIN/J5ndeKQ002ym0a0FF0dsJoBA4lSW2nTjqgelayf6V3UtKTwJISxBO3tMUfnv7yhcwLVrC2w38wIQMZkoL/xgbJOCZ7Pc2THz3c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789109356; c=relaxed/simple;
	bh=vXbtYJ/0QnNJmWuNtoAZa8iC/TA2rpk9NVH6xFuPuFk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=HacXKMXDLqfLsLjnXn7xKNhB0lXqJaX0x/yC8Fn789etPKJM2ehZ1Z1lNPkLkV9/DOlHlbn1X07sx45pM76T5vtIU/fDdMuoN3eXgPfFgujUhgNigT7a3nz6qiKXskvLzdwOMZB6VDnY0f44MHeg1h0wJ+bQOKij+I+fAROpwOQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=EF3JnNwT; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ijSlt7W3; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="EF3JnNwT";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ijSlt7W3"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68B6kS0I3909217
	for <devicetree@vger.kernel.org>; Fri, 11 Sep 2026 06:49:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	gXTM5F6UPAo8bhocaTwSxKvXBWJws+V339zaDC2FtUQ=; b=EF3JnNwTzH0Y6u3b
	P73NnNENr7AdKpehwFafjlB/Bf8qhn8ikYy2uH5t+1xHj7c/UazDRg7mr6qYVkSo
	THUJgs3F8JnDs5WlTmPCLa6e3FhesSCPjbTT7tNDJn3zFUqcSsiDr/9fEp0uk87q
	R/xjYQKkFJM+NzBMueUOgW9a/IG+vfxCwFwP2DUkvWBbKrtlhIfnwc1y/pY5NnJC
	k71R/pzuF+ozIoczx3bbLcqr9FmhP0fLtAvjGgPlbFfGM7GUGD7S/YldF8cJdvxQ
	FoVppH0+aQ7J5DndsA1ChF13hy374nH6L/XyecJ1zWy4jTBNoeVECQASkt5V7J+C
	vn4kdg==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gm2q125a1-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 11 Sep 2026 06:49:07 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-38ecc48b3c2so937968a91.1
        for <devicetree@vger.kernel.org>; Thu, 10 Sep 2026 23:49:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789109346; x=1789714146; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=gXTM5F6UPAo8bhocaTwSxKvXBWJws+V339zaDC2FtUQ=;
        b=ijSlt7W3P6yfOgQp5v6NaYDcCJoN6wGYCpD6EJYfXoRl4OSOlpFVnXJGXjk5OgC/hc
         X6MNtnsPzNagYBvjVUh/Wsp/fXF3cv5GVpfpPQEF2xJEd3Pf0AiveXRPlbNPgI0a1GdX
         l54BTlOPWvXFaENHbkwWeTOhN7FvDoCM6iiOyXsvp+eZDFZV1/oTKYTNit89S9YcOZcW
         /1nLUCfgod8dqGW+Ro/6LfSwV2wdk1tYAK2eGYiQUo00QeU6GUlzCxDmvLlNH/t/XvUh
         nBLjgH48JetD/HGP0yfIG0DECQr1YaA/OHroDEgLTSs9WvEWvYHMIp8kQ3795LZlnJCh
         QjAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789109346; x=1789714146;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=gXTM5F6UPAo8bhocaTwSxKvXBWJws+V339zaDC2FtUQ=;
        b=LGqglaCa8APbFgbCkJLRA8u5I8kMSgYHBpH5OZxcLjKiAoOrTytHn68N8pjOQ4B39Q
         u9uDKrn+jIdumQgtUFQR4kG9B+bEkow2sANukjuYgou3dqPxkthFkwh6aFELLW4oQzpx
         ucAc0TbpqdaJ0l4F8Uee4e/ahEiVBOrvepGsygvjBc5V1kloaXOjSDUwu6/a9tbaDTWa
         zb2qhQRysUBTBln0oU6ZP+RdErRNIRI+d9cesfL63AS644SRAlJtmPcspBjWTzg+hpmy
         oR57UKhpE75zMLrVvnHtzevKGo/ktP0PRX7Fr5KSsMKFnBGapLAwj63XmK9x9Ou47+ST
         4aGg==
X-Forwarded-Encrypted: i=1; AKwUvBxJJeRVn5gRYz5g4rjhno/nmdNbturcdiiFWPY25637M11MnG6Rw2LZ/JZXv9zgfkJ5JJcjr7qE6tdZ@vger.kernel.org
X-Gm-Message-State: AFuF++l42DOjNn0pCfwFSuELyP8FcjIp82xVFnmwAS69O8+L+O7J3jqS
	Y9PZE0TBTZKfQgHkvcwR4gXtFEmR88+0zxJIuyA7UNtXCoxgf9s3qHLlQ8cypJEgyO36xu1O4N+
	uPpnoWU/2HJmDNjcsys+lXJa76KR80jDSEQ9D2fyeZn6hcZ3osn2QdlPGZkqAz1YH
X-Gm-Gg: AYBFou1y2i4I4xk4ss03V6W9BoVjkCuN+c+XaBrYIlm9w8vsoBqUywrgrILdAv7DJHF
	NRl65XV1NHhdGyKslBdSV2hHfRVxNn9WWk3ILjrU7ExX8RLyXF3vmmyGEYJgxdaaRM88PYCWeLE
	Rtmfz+eTHq9u5Q9SHwX/5jZxjlOmoG5sXopzM10gJ3Y9GCHD/5rXmQlEh2g9Xm1GMLYmlwDuhmf
	SQZNRmVp7pgsa8SkKFRqvP2PpaYdL+1Yci6oIJ2LjV+4RGf17W+tBbp6tKhlwA2Phrdl6pE6VtB
	01frmisfUn7wjmFnhFMemdRIaMzM5A+NundT/dVVWvu5315hxzAjyy7GZj2EdFCT+LJ8P5uYvy7
	7+EpXm3N83RO/8lCMdgg+G5KG4tgh7IBVky8=
X-Received: by 2002:a17:90b:53d0:b0:38e:bfe:81e9 with SMTP id 98e67ed59e1d1-39d9bc1b0demr3969061a91.1.1789109346158;
        Thu, 10 Sep 2026 23:49:06 -0700 (PDT)
X-Received: by 2002:a17:90b:53d0:b0:38e:bfe:81e9 with SMTP id 98e67ed59e1d1-39d9bc1b0demr3969006a91.1.1789109345658;
        Thu, 10 Sep 2026 23:49:05 -0700 (PDT)
Received: from hu-krichai-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-14365b759d0sm4360102c88.7.2026.09.10.23.49.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Sep 2026 23:49:05 -0700 (PDT)
From: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
Date: Fri, 11 Sep 2026 12:18:52 +0530
Subject: [PATCH 1/8] arm64: dts: qcom: kodiak: Add t-power-on-us property
 for PCIe root ports
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260911-t_pwr_on-v1-1-a482d185f1f9@oss.qualcomm.com>
References: <20260911-t_pwr_on-v1-0-a482d185f1f9@oss.qualcomm.com>
In-Reply-To: <20260911-t_pwr_on-v1-0-a482d185f1f9@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, mani@kernel.org,
        Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1789109338; l=972;
 i=krishna.chundru@oss.qualcomm.com; s=20230907; h=from:subject:message-id;
 bh=vXbtYJ/0QnNJmWuNtoAZa8iC/TA2rpk9NVH6xFuPuFk=;
 b=yCw0gpVS4SrQ9Op2Ws23aLBLJOSt5KBS1rwHvY5tkNTnaNsnPoYHIQS059psGONsUCowOGwZt
 VkPcJugi1H+A91JI7a1WJ2Iy8lWeGrFNH0nqqAmK9Ih95/gsong1Aqe
X-Developer-Key: i=krishna.chundru@oss.qualcomm.com; a=ed25519;
 pk=10CL2pdAKFyzyOHbfSWHCD0X0my7CXxj8gJScmn1FAg=
X-Authority-Analysis: v=2.4 cv=d6lgWhjE c=1 sm=1 tr=0 ts=6aa3a463 cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=EUspDBNiAAAA:8 a=bu6UjZ7a5GH_BZZocUYA:9 a=QEXdDO2ut3YA:10
 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTExMDA5MyBTYWx0ZWRfX2woQqAdiC5Vn
 p0b+kse4HMOht6u/FJA1Lxmx22zbeuyQO9ZR1oFNWJDM4Jyg8txGKWFt1v1tcmBnxMKF+HEmBZ7
 wiiS10UuVUbJiKZuVjvhUTavYok3FKQ9yZMK49tCDTwjuFJhPcMepovgAhLzpWdUKNk2J0JtzKS
 NQwLfzjXB+y7Zl6oCUtUyJgsSdnaQzkn9qVbJtSKYNwnFpG0zwWAxqa9xn4YSWhYoPvZcpi0pam
 Lv1f9VlHzmkmiVHwL6oyGarK5NCzc83nUAziRb5248hHeLBHrjDiBgQP2AM3WMmJwQPf0GXHHlN
 b0hG67YaMu6FCwF7glj5d4bVxal4tFr4swwUzJT1g5jJqD86h8/WPq9lvuRj/7cNWgjf6xNrtbM
 Gs7Q3WADsyGfUX6yNNZVMGtYzf3IBvFtuGW9I7rev8TKw7kCXg2PkZe/YjncNdH1tfEcjQuFg9U
 TRBInPdjexe2Mx5Liyw==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTExMDA5MyBTYWx0ZWRfX34VL+xgegxYe
 6ywovVaox+roHyKkccZI6C7IvlLaP4sk74Jj6n7e0wDgd5g2nLmjj0jBr7w0XLhEMJ7F+t3JJwQ
 jm+MBqKTesPfpoKV5FNpFfBpf0Huxgs=
X-Proofpoint-GUID: EMbjAihJEboQf1CfiFGqfg8yHvknv-7Q
X-Proofpoint-ORIG-GUID: EMbjAihJEboQf1CfiFGqfg8yHvknv-7Q
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-11_02,2026-09-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 suspectscore=0 spamscore=0 priorityscore=1501 bulkscore=0
 adultscore=0 lowpriorityscore=0 phishscore=0 clxscore=1015 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609110093

Currently the PCIe controller is not programming the T_POWER_ON value,
which can result in improper L1.2 exit behavior. Add the
t-power-on-us property to the PCIe root ports so that this value is
correctly programmed during host initialization.

Signed-off-by: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/kodiak.dtsi | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/kodiak.dtsi b/arch/arm64/boot/dts/qcom/kodiak.dtsi
index f2da3706d5c8..54acc7d9bdea 100644
--- a/arch/arm64/boot/dts/qcom/kodiak.dtsi
+++ b/arch/arm64/boot/dts/qcom/kodiak.dtsi
@@ -2306,6 +2306,8 @@ pcie0_port: pcie@0 {
 				#address-cells = <3>;
 				#size-cells = <2>;
 				ranges;
+
+				t-power-on-us = <80>;
 			};
 		};
 
@@ -2439,6 +2441,8 @@ pcie1_port0: pcie@0 {
 				#address-cells = <3>;
 				#size-cells = <2>;
 				ranges;
+
+				t-power-on-us = <80>;
 			};
 		};
 

-- 
2.34.1

