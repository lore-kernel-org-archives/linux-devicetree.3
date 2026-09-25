Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1FE63332EA2
	for <devicetree@vger.kernel.org>; Fri, 25 Sep 2026 06:14:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790316851; cv=none; b=jAODILcbbpLYXSxi3vfXkamnl65IZwRBz8iwJEbGR21AYqzMJpKro+Lg3RvUNQGUsGGYNM3WL9NrZPwsnBLvG5PXkNaM01Tyd787eZ1EU1WqFxt+T6hEiJGa7GdEeqmiBALoZ5H7BOhvMfiYLCtdpVxlQQVv1btBxh90AINSJPw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790316851; c=relaxed/simple;
	bh=N0OOnxapM5BVqS0QhcEoUV0huDI5emgXQOtYs55ziCs=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=TloNF5jWAGuxVWTQeEWdyFOiR3hIkNKhVDUgcf5iExjwJ2BBxHS1qfyAoMrIvsxqCvexmMc81lG1/MTq2yFew6eMOn8e8TsSXYJFOeP+5qW6EB3YylQfe+xAEKEh9aW5tS0fDNlkqZ4yC4SK6Ep0qUS9DqddK2dk0tARmBOqts8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=itV/Xc2O; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=YBoKYBBz; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="itV/Xc2O";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="YBoKYBBz"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68P4Yx9G208909
	for <devicetree@vger.kernel.org>; Fri, 25 Sep 2026 06:14:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	MDH76ytCDa4JSm1/Kre1+UeN1hcmafzcONYDPIdKbpM=; b=itV/Xc2OUeqwGC9f
	m4YdvsOk7656+khmB0PPENw8pBkqzdMIFCe5Hh1geC5apoe5p/m0q2vIw+lWzeDo
	t8xU/Cm8fuJDmtwQFE6LKNNDUBN+LdEShD9ClhWJWZLbUW80T/KGZ0w++ucVRE7R
	2HiB4Z38IHxRG6ERLoNnnH/mgaB//AUwwnSFm7s9tvzfomVUASscEK/M7Cmt+vYN
	g95X+Wy91hVGrLLzA8qZt8N+ln7x3yPXvzDtFMWwOfkdiVlcpOFxyOHCsHDkmDVH
	wyy/XBPSMg0VUp8JRODExgoZQlLz/DlOJ7k5pmTXBdOFKkyilZYMc8/fvFzfvVsW
	wqxc3A==
Received: from mail-dy1-f199.google.com (mail-dy1-f199.google.com [74.125.82.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gw898t9px-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 25 Sep 2026 06:14:09 +0000 (GMT)
Received: by mail-dy1-f199.google.com with SMTP id 5a478bee46e88-313d1015161so1856747eec.1
        for <devicetree@vger.kernel.org>; Thu, 24 Sep 2026 23:14:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790316849; x=1790921649; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=MDH76ytCDa4JSm1/Kre1+UeN1hcmafzcONYDPIdKbpM=;
        b=YBoKYBBzp/oykq0+W9ge2RqX4Y3h7dmadYhbK4q7d879a0uHrR2wMi1qoUTxcoq2tb
         rmU2Bj5JZ0OT/3h09ev3ttOjWjT6ZdDy3q8oIPR8Ych2+gZrtKBfcdrcPJ9tAKRgEdUc
         Yn8nBGJMPp0+FKyMURw7ekjWmuPluM4jWaDYRzZk7DmGpzTgJY8YRQOZYKh3bMcL8vw5
         yYOCs9CsdRpbI3fPC6hpGplEzr1VI6WJ3H4P7YOWpADIbsPfi/ZX7BuBzX5TiuqEmcfX
         cnkYZk31IIkL3iyqt7H0oJvos5GnEXpi9Pr8ILJ5ejwl89fLZKZj+sQ+iJ7yQsRxyh0s
         bhnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790316849; x=1790921649;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=MDH76ytCDa4JSm1/Kre1+UeN1hcmafzcONYDPIdKbpM=;
        b=r/5s+L5WIwObJPc9AEsN0W3yx+mWNknZn7K9iOx+1wSr9/3cWCEGIXyu94N0N0UQTZ
         P+Qxg0fIxRrevgkYMIFUPbEtqodglYq8lbleCj6F1uGEuubgw+5DukHU+mfOIyMqfe+4
         T8hyUqUDkHLB3favOPEMAD/bOaM/+xwnDDbZ5/POeS2RPNv+R8e6fy+0aoRrSA6qw2t4
         Gu6GMLwqjmECytptbhOVZrA4IDGnYJqSdGflgQwrDN1VlRRNjdeiZVZliewaIaU5LAyD
         eH4rNIgfojyqlADFYJcz/5hbSUaw0DQNSXA5LDzCi7r4TEFWpy8/BfYyfS6tndXJkbL0
         Z2fw==
X-Forwarded-Encrypted: i=1; AKwUvBxLkT2P1QWp3HlLSSQuM7CxM6Mz2VKnk2ncVwUKHPGroUdyRzF4uVVud8eFBdSP6lcUA+7EQFjfl5No@vger.kernel.org
X-Gm-Message-State: AFuF++mXIkgIQupGoxkn5g0N2CC1sCymFuddqc6JRPI5qizHQrXl9if4
	3RcZCvMIhuEMa7Zcm+Q8gL1YBcEILvMOuuSxqyNisLjLjc2Bz5rabv1asunh3TEMc6pY5hbwd05
	oA72wDKRMc8DrYzWXwJIWRdNw+e5EzPfwiuLM/nmX7croqN8Fccya35ADS44PltgWwUpQ62Q+
X-Gm-Gg: AYBFou31XExHTnpTncNREKem1PZPBz32KFTTjLfSqj83IouqwoGukR/b3T3H3H7iU6B
	9lFe9vkueyqixE2MmNyW6czmc9wDrtWwtHEH/rJ68+e8iw3smCVreMAacfgGtxpTP/eX6Q6GPJE
	XQ+D5XVlcYoBuocljyK/yynEqxluOxP/9t46erHuz9l1s2IrJ4ekAKyXqJRc4oAThAn/j0G/fuq
	3yFrMnyk40ptn+e2D3cIs8nXVUXn5ctClQlLsuRlyJ0q/q3buLyXsSGGLXld1d/R74EGkDmzVE1
	9iGW4MaWyi5+W4IcCIsUlv4bd2vbfvBQgO7wrwlelZv6MvqTKL3xo9Ow/vhQpJFkQhd8+fHII+p
	hGcNQB99xIbJhRnPGEMsqtQtfGz7d
X-Received: by 2002:a05:7300:a21e:b0:341:cbb8:3c0a with SMTP id 5a478bee46e88-341cbb83dd6mr573160eec.0.1790316848360;
        Thu, 24 Sep 2026 23:14:08 -0700 (PDT)
X-Received: by 2002:a05:7300:a21e:b0:341:cbb8:3c0a with SMTP id 5a478bee46e88-341cbb83dd6mr573123eec.0.1790316847633;
        Thu, 24 Sep 2026 23:14:07 -0700 (PDT)
Received: from hu-ysiddu-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-34145c17074sm3381039eec.26.2026.09.24.23.14.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Sep 2026 23:14:07 -0700 (PDT)
From: Yepuri Siddu <yepuri.siddu@oss.qualcomm.com>
Date: Fri, 25 Sep 2026 11:43:35 +0530
Subject: [PATCH 2/2] arm64: dts: qcom: shikra: Add WCN clock to Bluetooth
 node
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260925-bt-wcn-clk-enable-v1-2-30bee88c4de4@oss.qualcomm.com>
References: <20260925-bt-wcn-clk-enable-v1-0-30bee88c4de4@oss.qualcomm.com>
In-Reply-To: <20260925-bt-wcn-clk-enable-v1-0-30bee88c4de4@oss.qualcomm.com>
To: Bartosz Golaszewski <brgl@kernel.org>,
        Marcel Holtmann <marcel@holtmann.org>,
        Luiz Augusto von Dentz <luiz.dentz@gmail.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: Imran Shaik <imran.shaik@oss.qualcomm.com>, linux-arm-msm@vger.kernel.org,
        linux-bluetooth@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org,
        Yepuri Siddu <yepuri.siddu@oss.qualcomm.com>,
        quic_mohamull@quicinc.com, quic_hbandi@quicinc.com
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1790316831; l=1435;
 i=yepuri.siddu@oss.qualcomm.com; s=20260603; h=from:subject:message-id;
 bh=N0OOnxapM5BVqS0QhcEoUV0huDI5emgXQOtYs55ziCs=;
 b=qgv2xkw7Prwdx7QeTw1JEJI1qxL9krj+1XW2HC4Jd7ADQ9Y/REcXaFmuvm0/Dc/zeytlEAhHm
 HfYlXhF65tmAeK8hXzY8k/pI8F6gK+BD8rsr6QEb84yY4kB+7gNAUdd
X-Developer-Key: i=yepuri.siddu@oss.qualcomm.com; a=ed25519;
 pk=ldEQwkUmctxwDtIVURg3xvXfzZavX8decqpk/pVLQZg=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTI1MDAyNCBTYWx0ZWRfX4W7BMS2D5rMm
 bcN2qVQUeKC2BtETONwNQ5PIr29DfqWllMM0AwzEIorttetY/s+21NfUGnmqnm8sugdVfF1z522
 Pn1GYtdtz2P2YAjItsfXXZfPsCzLWNsPMu+OXCalwwGcsLPyO5uN3A0Vs50j+PoslrEx8ruIH/B
 xf3LXE+Y60ImVuWRurb3xfZOrMl2qxanoGD0Ftr275+Y4eos0T91kx0VGkz6hcgUrjQJNJP6t6n
 0zNoHIHv8gXEeJfgibxYubeUq+ZyE2lZtG+xTAGSnGqG6sYpQ5BdsVwN1hwjTvV1cyMDWkqjSip
 n0imKeZH1Z1wZ8/E4eEsd4rSDZVty/q6Z/hCW+rU5FaBi13deTwKmyGQjsz9ieWyuWsL9G2CThe
 opZFZLi5HfDwQa01bzLwb+np9P216cDy1TLk92QpFzBKoijHmFVEfEGnk7E+5qJGQA7qLq2r3jl
 W7GCC/jxfePWVkAxizg==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTI1MDAyNCBTYWx0ZWRfX+YnVQ/a5gsEh
 UhS5ZVb6m56wpa41f9+WxmQ0xyZrmJ0fqmCzZWFeBru/952EY9eAuyJ6NvGizoSdSrOI/reQBcf
 nQ4Tw8Z8BFCDpA926zl4Es0O567Olhg=
X-Proofpoint-GUID: AjJ51QaC7euON1zAwgOaiUQHpU1i5mei
X-Proofpoint-ORIG-GUID: AjJ51QaC7euON1zAwgOaiUQHpU1i5mei
X-Authority-Analysis: v=2.4 cv=EJWTQFZC c=1 sm=1 tr=0 ts=6ab61131 cx=c_pps
 a=cFYjgdjTJScbgFmBucgdfQ==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=GHRrtK_Kqm7Fu9zWAW4A:9 a=QEXdDO2ut3YA:10
 a=scEy_gLbYbu1JhEsrz4S:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-25_02,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 malwarescore=0 clxscore=1015 spamscore=0
 lowpriorityscore=0 suspectscore=0 impostorscore=0 bulkscore=0 phishscore=0
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609250024

With RPMCC proxy vote removal, the Bluetooth node must explicitly
declare its WCN clock dependency so the hci_qca driver can vote for
it during BT power on/off via the pwrseq path.

CQM SOM uses RPM_SMD_RF_CLK2 while IQS SOM uses RPM_SMD_RF_CLK1,
reflecting the WCN clock assignments on each board variant.

Signed-off-by: Yepuri Siddu <yepuri.siddu@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/shikra-cqm-som.dtsi | 2 ++
 arch/arm64/boot/dts/qcom/shikra-iqs-som.dtsi | 2 ++
 2 files changed, 4 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/shikra-cqm-som.dtsi b/arch/arm64/boot/dts/qcom/shikra-cqm-som.dtsi
index 8ac42ff625a0..4e03e459c7c1 100644
--- a/arch/arm64/boot/dts/qcom/shikra-cqm-som.dtsi
+++ b/arch/arm64/boot/dts/qcom/shikra-cqm-som.dtsi
@@ -220,6 +220,8 @@ bluetooth {
 		vddxo-supply = <&vreg_pmu_xo>;
 		vddrf-supply = <&vreg_pmu_rf>;
 		vddch0-supply = <&vreg_pmu_ch0>;
+
+		clocks = <&rpmcc RPM_SMD_RF_CLK2>;
 	};
 };
 
diff --git a/arch/arm64/boot/dts/qcom/shikra-iqs-som.dtsi b/arch/arm64/boot/dts/qcom/shikra-iqs-som.dtsi
index 4ff97945274d..227283ab74a8 100644
--- a/arch/arm64/boot/dts/qcom/shikra-iqs-som.dtsi
+++ b/arch/arm64/boot/dts/qcom/shikra-iqs-som.dtsi
@@ -242,6 +242,8 @@ bluetooth {
 		vddxo-supply = <&vreg_pmu_xo>;
 		vddrf-supply = <&vreg_pmu_rf>;
 		vddch0-supply = <&vreg_pmu_ch0>;
+
+		clocks = <&rpmcc RPM_SMD_RF_CLK1>;
 	};
 };
 

-- 
2.34.1

