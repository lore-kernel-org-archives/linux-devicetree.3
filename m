Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793173869;
	b=JD41DPy/csl+Xn13k8rFey+ZOS3ZUAeoLwHnRGQa4KjF4J/4hbD5LTQIYq8lmX9XdTHN
	 KgTVnun2hN49+4E1GeF+C6um5NN6ySgzk6dqTbeYY5mnVf04rfYhBQ8wXYXbOAwhj0Ndr
	 ikbLcityxKxdq8UYVMuQ8OtNNFdrzoyWLsOXirjIcwSrh2rCIy8cwyQVHUuZaqQCj2JEN
	 FbKNapay5xYcsoN39KaO/YgSOYRVW0hKjXXKGLBNzWIA+NTYtF4iw+76hIcCG7s1a//YO
	 MqaTPh8ttEB/7CPLyMX2RQdeQlc0qCl9R/8TmMao5J8XhfB+vdFyB8ZCxFA+u63C5eg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793173869;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:
	 Subject:Date:Message-ID:X-Mailer:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-Spam-Info:X-Authority-Analysis:X-Proofpoint-GUID:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=zwOSIJQjqu1jiO+D10Z660xd0C1HKGPEar6chOI2AHs=;
	b=GPaVBOEDOizf8gerx4E9ig4QR8pnS1ZKD9OtR77iDLlA1PcogeVi8VsLB/qjDw+BCe4p
	 IUPklLc++faa/hcu93pSllyFR7k9q9CRqP2lyvDqGgoJAIYgg/fkFzxzJJ3+oXFmFNiLD
	 /F61YIycYTwF0cdRVyITOvYlLsoSbFvrpo8VGHkqmqew04lgFKleLRfM09C34PMJ62dTv
	 hCxrX6zoirvYOFS44kdaOdLfaA84AAtmldh/eOQU2v6/noQu/hltgghaZpW1eZnHVmR+u
	 dp225K8Y4s/PMAkMJYw6Rrr3kxfzk945yJxdpGIjnY2H8D6r/G+v8lTHE67tFxXtLIg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=hE0aSd1o;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=gmY6Thji;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B1811606A31D
	for <devicetree@vger.kernel.org>; Wed, 28 Oct 2026 07:51:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B1811606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=hE0aSd1o;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=gmY6Thji
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69S4Q9sF2753513
	for <devicetree@vger.kernel.org>; Wed, 28 Oct 2026 07:51:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=zwOSIJQjqu1jiO+D10Z660
	xd0C1HKGPEar6chOI2AHs=; b=hE0aSd1o1OyH1owE7CEwhpoMUehIl9Dop7ISz0
	wVLZ/wDDJQZ9GibV8DSUn34BgYXrp+g2AWqtYSiV8QgwDtghqkJSpNSWskVhfYO2
	ETZqLGPcXTPrM8uO2kJ03OjXoc/gJT8zWs0ROcgMSa4So41FJzeQ3poyKKQT8qen
	UeAYxllf9tAgmJqc6kTylmxf1ZVBA8tFN9xoQE1j6TEZKDMqRYG4kQXEPzyuwy9g
	HCdWDmSo3lwH9ZKIPwX6c1iHegBg9lLITLwTJMnSKHpHY2pgQdQLQG1x76BIL2Fd
	mrsX4j6NfnUaOYPbLDi/E+VT5BpjFcHe0gPIoVOGuDSm5VsA==
Received: from mail-dl1-f70.google.com (mail-dl1-f70.google.com [74.125.82.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hjy7134j9-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 28 Oct 2026 07:51:07 +0000 (GMT)
Received: by mail-dl1-f70.google.com with SMTP id a92af1059eb24-147be78cd56so2130302c88.1
        for <devicetree@vger.kernel.org>; Wed, 28 Oct 2026 00:51:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793173867; x=1793778667; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=zwOSIJQjqu1jiO+D10Z660xd0C1HKGPEar6chOI2AHs=;
        b=gmY6Thji67U59lpx8Ch/zGGWkmUybnVTONV9oNDoWm2QOyBJPUSEu7FzEzKZvtmhW/
         5wAoAgx0hcN4nLOWLFBGxQ3J/TWcmbCcbt9lHv0APVCrIbHx/m3unaoJmG99edc9xeCc
         p3KounxSZkjKbeWGyo7i41Ginik2vGF3f8Gekeif29SjgNfBMXpH+5LQY5DVRfe7gv06
         kaiJcLDhnGHjScj9kD0L6pAMfRKfYKhQDIsyJBsNI8ZETQZvk+ZoRBGQOVM+8SLT/j+4
         Yrs6CEQVtzh1Z6gbf9tCmrVq+L005GTQYnT5+L2ReCu5nUndBEZySYjzlpql88dRkqRf
         EVdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793173867; x=1793778667;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=zwOSIJQjqu1jiO+D10Z660xd0C1HKGPEar6chOI2AHs=;
        b=X4KGtwz94Xs2hIZwg9E7HZzGXjfoiDVcT6lUKn13TX/evhd8/IH1xhSmJMb5kbqhbc
         yigVBN+d5UBkZHKvM6nQrpn+z8eKfTJy7c+j0+i/h2pzASQWAGw5AF3Ae8e2Ty/nH+ZV
         WUsE7sxq6V1RVlOkhzlY3RPYMHcAr7crTlshx6aboRunadpdaVdiDPtixtBgLCim7Rwv
         +LXkSdEYMtJbGYke5sCNHxQgGGdnIneH9YoJeUIbbsKclUWz9KMgxGgpFtlvNptkNTaf
         VllGOZZMW+rRWBUE/7Lzw2L+n7RzCWjrMrYuD2lEgYspNy9nfouohNfnmFaMm10H4z5z
         dmkw==
X-Forwarded-Encrypted: i=1; AKwUvBz40B/Fg3mfHvFUDyatqoWJb9s3mTVcJcYW6GrGb97eZTVoPE/uN9tLgUO+Wd2tnSRJSucw1rchCkq1@vger.kernel.org
X-Gm-Message-State: AFq9FYKNjQIforsamwwiwHY+9QVJz6LoOMN9uwwoOq/GA87BFMWvWUaK
	eakVujI0+Qy1VXt3DA69YRIWSwd+761bS7r/TaAoacEmm2HHUfT6MuncpDGD4mu483YFqFPQRHj
	q14Gf5W/UR0sPpU4yHWa8W5VihUq9VPFUQRDhWfQn8ys3aHKDA8KBrQGF5PCpjgf1
X-Gm-Gg: AYBFou3oAFdXh0tCAuQJwO/c0qiX/i+IlDFWFvTVGolD0SS6/HsDlI4PSDdS0g6Bq1D
	955ycUj6qGILLXZU8pcfXddOz/DRN8NdLjoCnFEultQZKapifSIsNvYpcx3O8OU/TuveGyhL5/5
	T4yLEpokxVUyp294d/4JuNcTIckO5nurj0kp+QAQ9fvp9ykEYH9QNd1+2HJM1HJVtTan3b8OcBh
	F8l+9N+OWRzC93QHe4EoN8GPdm3PtlAzVFrWnTvVWSPeDPOshPwPP5ISS3r6QYd8f2nEL7zLK9F
	VHDe29VSXf7BEorPvJZh+jx5VVrSnonxnqxF5W3z4PppKnw2nY7nHmpIoxLGLKPHiTpYpWwXBV1
	SFwZHMe1Bde0bg2gKH/cSao1wOcgKh5Egtp85HA7wcJsWwP4HSrqdfo181t5JZXHb/O+DhbF+bx
	bt4FyuPlukbGvq4FohQaLhjJy5oza1Ll3c
X-Received: by 2002:a05:701b:290b:b0:17b:fea8:1425 with SMTP id a92af1059eb24-1a6cdc492bfmr2054912c88.30.1793173867059;
        Wed, 28 Oct 2026 00:51:07 -0700 (PDT)
X-Received: by 2002:a05:701b:290b:b0:17b:fea8:1425 with SMTP id a92af1059eb24-1a6cdc492bfmr2054887c88.30.1793173866516;
        Wed, 28 Oct 2026 00:51:06 -0700 (PDT)
Received: from QCOM-aGQu4IUr3Y.qualcomm.com (i-global052.qualcomm.com. [199.106.103.52])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1a75c814917sm3430261c88.5.2026.10.28.00.51.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Oct 2026 00:51:06 -0700 (PDT)
From: Shawn Guo <shengchao.guo@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>
Cc: Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Jie Gan <jie.gan@oss.qualcomm.com>, devicetree@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        Shawn Guo <shengchao.guo@oss.qualcomm.com>
Subject: [PATCH RFC v2 0/2] arm64: dts: qcom: nord: add CoreSight debug nodes
Date: Wed, 28 Oct 2026 15:49:32 +0800
Message-ID: <20261028075044.431228-1-shengchao.guo@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI4MDAzMSBTYWx0ZWRfXybFTHecQDMqt
 TzboeO0UZ+/x68Viid/yThq9FBc8ZRF517nl1EcM++AaAcxLmQY7Z/8F6gZ8EqjoDja1TujT/Tp
 Y7CTdjvmskYOZtE09e8pG9U+y6yj5++OxqH7U5z41DtADL5pXYVLOdNPV0CRm5kBRQSLWAdOuSc
 rsa+gvZxoNfKFDh1Ts6EkgWoPCilfoHQR/2HTHXL5TCpzo7Rlu9Im7JWtn0MCizQNBgdrRow3H4
 ZpKwFjOJHM85cJAeKBAWz+Jy4A2jiJBPUXHwh6sUlTpCwJXrF/AXxlrAExj8l/+wd2geTdej9RM
 7YddDcZnj0JtzyrnLXWqw8q1poPx/4YQ8hyqbgPKb526clMtLXOnW23pim6KhbhhGSy7RhYD9KT
 t9k8Z1ZjovSfJHuTLraQhK7Z6h8jjZDmtc1w9ttQFZr9mPeChtiD3w5Ey/g0jeHR+gE4V6f1gPk
 yIrxFlzqiuuWsbjyaDg==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI4MDAzMSBTYWx0ZWRfXzg4DcBSvSI/v
 LrNML8qybkh9VwR18q9BLt7Xrfg2NdLFOK1drWEvP32D4iVw6/4VQPyUsyPS560GN76VXXeHEhb
 CEgu3EUp+EVSRrjxAsbN9mdT7csAt54=
X-Authority-Analysis: v=2.4 cv=JspkP84C c=1 sm=1 tr=0 ts=6ae1a96b cx=c_pps
 a=SvEPeNj+VMjHSW//kvnxuw==:117 a=b9+bayejhc3NMeqCNyeLQQ==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=GL7yGNlxQxINzW0oewMA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=Kq8ClHjjuc5pcCNDwlU0:22
X-Proofpoint-GUID: eNsqDX9zH5VTKt1_4LsRBJzc9bt16kIi
X-Proofpoint-ORIG-GUID: eNsqDX9zH5VTKt1_4LsRBJzc9bt16kIi
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-28_02,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 phishscore=0 adultscore=0 lowpriorityscore=0 clxscore=1015
 spamscore=0 priorityscore=1501 impostorscore=0 bulkscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610280031

This series adds the CoreSight trace topology for the Qualcomm Nord SoC.

Dependencies:
- [PATCH v6 0/5] Fix traceNoC probe issue on multiple QCOM platforms
  https://lore.kernel.org/all/20260710-fix-tracenoc-probe-issue-v6-0-41eb36fef8d9@oss.qualcomm.com/
- [PATCH v5 0/7] arm64: dts: qcom: nord: Add remoteproc and PMIC support
  https://lore.kernel.org/all/20261014063953.549379-1-shengchao.guo@oss.qualcomm.com/

Changes for v2:
- Tag the series with RFC due to dependencies
- Fixed the ddr2 TPDM labels: tpdm_ddr3_llcc_2/3 → tpdm_ddr2_llcc_2/3
- Renamed tpdm-nsp0-cdsp-llm-2 → tpdm-nsp0-cdsp-llm2 so it matches the nsp1–3 nodes

Jie Gan (2):
  dt-bindings: arm: qcom,coresight-ctcu: add Nord
  arm64: dts: qcom: nord: add CoreSight debug nodes

 .../bindings/arm/qcom,coresight-ctcu.yaml     |    1 +
 arch/arm64/boot/dts/qcom/nord.dtsi            | 3088 +++++++++++++++++
 2 files changed, 3089 insertions(+)

-- 
2.43.0

