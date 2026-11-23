Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795414767;
	b=lAUq1pQAECz5SBMz5Duvt71RnUzO8XOR7/9gZKax32yHXJM00DCmOVuCa6rBUDCtti5E
	 juocxCOPgQPAKxZsh5ejzyKQOaMncXkAD62q51IMn1zA+qmlG/b1fIcBUtkQEmL65Ptu+
	 /r5d7C5rPdd/sBQ7BkiJ5QR0vyUZAgWN1kKoW8ExUHzyuiuLdQL+2HCglRPXvlmpp0UAE
	 qIWtBaaH+w1JYWU+9l9UqoLQK/Zyuqk6jaczLTTtQfQ67mioY3wVoH0E4qjp/UKRscOoq
	 4N+aIhuKkL4nF60YRQgdQr3So7NNqRnSDxI7UMES0yUnyUX3nVai5Mtq60T7eqXS2sQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795414767;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Authority-Analysis:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=LnOyj06F+Ktp49SgL3+ySurcIE3BBa2kndRV3EjfiQw=;
	b=vbi5FD4ADqrX+OBt31gAi9LtyXKcCUZDaixCL1Xn/YtVtLThkAgMsqSP8LRn2HfgIzoj
	 dj6o0qDy1bf/Em0Y4s4xtj9Z9CFGkk36Ebl2WAtN5qjxpZy5VfZ8lk8Ko8lDtKzbB99q6
	 /CPyv1Uvb5bbob+EcbTBQ8d1IZXS045isNLF8q+gM1fi8oSVXFMhwkMDZpHEoAQ8L98UA
	 4NQH1TNG+4NiPz0dNFioQLi0vjnNd1z5Wr8YjDm8EvJnCrbRZkGeplrnNSxryDvfoCLZ1
	 BpG0Xz5ZE9qfKdAsSoRUhNHec187qVjt8kiIoJ6ne/XLetX8mg4l5Y556ZN5c9FMkSA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=NVfJ686G;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b="IJlV/ZQs";
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 72588606A31A
	for <devicetree@vger.kernel.org>; Mon, 23 Nov 2026 06:19:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 72588606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=NVfJ686G;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=IJlV/ZQs
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AN50vnh1960978
	for <devicetree@vger.kernel.org>; Mon, 23 Nov 2026 06:19:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	LnOyj06F+Ktp49SgL3+ySurcIE3BBa2kndRV3EjfiQw=; b=NVfJ686GSFZwgzVY
	dMODvF2d5d6zL2DymHveFxSlL6shJnig4tmG+5iVNo8+4aGZxgOAfopoYW9oyP1N
	ESPFkj5uMrKCI0wg9LhjhXNfibNLuuzj18Aj+4kN26/oUf8qxvEe9OIjbdUelYW0
	Hj4SshGexJkJ5rS6fCwtL4qdch/BQMlYOWgV2jqPNNU7y+pXSb5zCH+M0wnGmbYd
	0lpnf1h+g1LovzIeYPwPK9//C969d5K5KvcBk4pLEVNb0BounxebUi/X72ye0fjB
	RSjQsdNPsUiYRsNPj3uO7Y/bHwicjv1fhzCCGpKt3yNu+oolSCpB10dxjW3GinDV
	sMtJmQ==
Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com [209.85.210.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j32a6nhjn-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 23 Nov 2026 06:19:26 +0000 (GMT)
Received: by mail-pf1-f199.google.com with SMTP id d2e1a72fcca58-8b847ab3fd3so3389021b3a.2
        for <devicetree@vger.kernel.org>; Sun, 22 Nov 2026 22:19:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795414765; x=1796019565; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=LnOyj06F+Ktp49SgL3+ySurcIE3BBa2kndRV3EjfiQw=;
        b=IJlV/ZQsInja6sMCp+vKajqH2CqaZgy2HnwJkR+e4sOVmvADnIVC0MfF/BsDnHwcjU
         dFf/N8jFrWATq/KujB5i1tf3UPvQupz805F9048pekf82n0kz3b4KLZFvCulHLziRiYI
         +tI1xqinFIMU6uvunqf8sKIAg1rM5AzH+gPdiSj1ArmdIgz7O8PZvODGleIOkf3micsu
         qOiO4KnZ3ao48U8gS0uIZ7VeRXzAalczIAe4i4i25VkF7oxQ2lU7cMQKuK2a0CJcgdtb
         JsSDVJrf7nvAZE1MQ71Ys4FLnDcFwrSCW+AlY7B149k9/jt5MspW7wB1aGygP+GczfJe
         RUTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795414765; x=1796019565;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=LnOyj06F+Ktp49SgL3+ySurcIE3BBa2kndRV3EjfiQw=;
        b=j3vBZXaS44gCjpTaKme8/Jm6ylSY1ysMMJVK5Tcvb4y1cR2rKk5vQSgg8ERTbihOcR
         J5Db8pDgD2ketMMj+6Yl0VJ69NFdwtvToiCuy7OeJo9scNk+WTQnDz9d0ymZo2lyCLwm
         yvU1Clf7OBbnmr8uAKgkA7axdenSM5c0IvQnIfd+BZxCz4QmaahdTGL6ckTJYlRhXA1p
         MXscpNxMg7u5p+BUdqXc2wK8RhMw6eWA5qhFucEIa+RbkLqcWnd2siMlFf0dVKHtFhCa
         gno/AbURIgv5TZKL++qPB7Olp6pNIsDAswTMIlkfT7SWEv84CNIYs79U2/jnP+yz+uYn
         EcAg==
X-Forwarded-Encrypted: i=1; AL+hErHzOFD7AILoxRJn6gzFp8ks3B7CmFlGOm48RuZIyxaoO97eZisQRzDhVjw4wmBBPLAY2RRsG4OQl+5a@vger.kernel.org
X-Gm-Message-State: APuU4Z8gJjnXS3X7c/Bjrl+i/t+1dzfwRvqX54qMSeBO2CnSKVSdXH9p
	Dr1vacZX2guB17rOp+zziwzEls4uDpuibkAyaiWnyfJjCwvNLCezXooLbMqFHKQaJ7158FN7V8U
	GqmFFeVaSM2Kqv5lT6TUKDGvrwnTG68LBEuNznMhffh6TScl/EfJ+kZIQWzrGWY25
X-Gm-Gg: AZFdTZc5LE2DRdKXd5s9wJY5qf2Gy8BjB983HhHHtHv2IZNUW6W+5eeXz9qv3/y3ror
	NoPblzwJO+FhSswcjA8lJgFlFwzqndaxJ55BfisT/Kq5gTsls3igAyuUIazSjGzqGsX2xvVle35
	jO3IRRAU85oTDvgs/bV4XjbP04m9nhRd1L9tRezI29ZuwAVi3MFVbSDrxsL/5NZSD0osqdv+LHW
	DgP3BZTatfarmzgNNchQNA6EY9ZHKOLqRov3Yb3ex9lh/DZtpA2pQ75ift6dfF2rUXBo/pb/i18
	QVPFPR0CmP9xthvtsA5lHEk60L1Y2/gjF+5i+y28TPwRSTWaNHiZgQV1+78IJSJhDCEyPQEJBqA
	jrg3jHBSQnl/747t+VwmqCqjLymjdOt26wz7pQS8a2LP1aJ44NuHGw7WMDMFwByZoM3gFuP4JLB
	z/U8QQe0ckpw==
X-Received: by 2002:a05:6a00:460e:b0:8b5:7fc8:867a with SMTP id d2e1a72fcca58-8c87ce31324mr9147452b3a.36.1795414765416;
        Sun, 22 Nov 2026 22:19:25 -0800 (PST)
X-Received: by 2002:a05:6a00:460e:b0:8b5:7fc8:867a with SMTP id d2e1a72fcca58-8c87ce31324mr9147441b3a.36.1795414764952;
        Sun, 22 Nov 2026 22:19:24 -0800 (PST)
Received: from hu-vishsant-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8c87077944bsm4955870b3a.2.2026.11.22.22.19.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Nov 2026 22:19:24 -0800 (PST)
From: Vishnu Santhosh <vishnu.santhosh@oss.qualcomm.com>
Date: Mon, 23 Nov 2026 11:48:57 +0530
Subject: [PATCH v2 2/3] arm64: dts: qcom: agatti: Mark RPM message RAM as
 no-memory-wc
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261123-rpm-memory-non-wc-v2-2-3e868b4bfa48@oss.qualcomm.com>
References: <20261123-rpm-memory-non-wc-v2-0-3e868b4bfa48@oss.qualcomm.com>
In-Reply-To: <20261123-rpm-memory-non-wc-v2-0-3e868b4bfa48@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Raviteja Laggyshetty <raviteja.laggyshetty@oss.qualcomm.com>,
        Imran Shaik <imran.shaik@oss.qualcomm.com>,
        Xueyao An <xueyao.an@oss.qualcomm.com>,
        Sneh Mankad <sneh.mankad@oss.qualcomm.com>,
        Monish Chunara <quic_mchunara@quicinc.com>,
        Abel Vesa <abelvesa@kernel.org>
Cc: Komal Bajaj <komal.bajaj@oss.qualcomm.com>,
        Rakesh Kota <rakesh.kota@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>,
        Kumar Patro <bibek.patro@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Vishnu Santhosh <vishnu.santhosh@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795414746; l=1519;
 i=vishnu.santhosh@oss.qualcomm.com; s=20251203; h=from:subject:message-id;
 bh=h1TRRDqAF6Cbs2paCuOzlsmc7MRO+Y0BoUrRpV68QoM=;
 b=bQhjtMHD88Cg8NpU1PnpLJrjHPFBhrcspk8vvg3d1TFEkaTPMPRidRE88JaIIM4fbDYiIoKl+
 6ZhCFoGjquNDLVtFyHEBVyd6lAqDNzYM1n2VWP02Rf27iOCFkAtPM9E
X-Developer-Key: i=vishnu.santhosh@oss.qualcomm.com; a=ed25519;
 pk=G8/AJPecB1feGI7wxArGWGN0PPGQS0GUaD4THQCbdis=
X-Proofpoint-GUID: 4T3hTSs0YuisZvTo0xKE1f14WKPIejSD
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTIzMDAyNCBTYWx0ZWRfX2u79wQ3E3cPu
 QhW+AajGtBxYXpCF8vXd5pQ89yJg/18EH6lvC2yi4sRu1uZ30wECWQeOz+XZbr2f/8oNcvir285
 DCbicToXqd7CuuzZ3KXuwf9zY5VGL/Q=
X-Proofpoint-ORIG-GUID: 4T3hTSs0YuisZvTo0xKE1f14WKPIejSD
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTIzMDAyNCBTYWx0ZWRfX4LVTPET9cbCr
 b8yH6Vz0bnmpc3E+/ePHMuCpgEgxSLsStVVnbUYRyfn2sLFB6Pyz1vWtaQEcempOcoTjIl35Ynt
 VMb7dy6N+wjATs9DZF9RikqlLphf0mqMbBYl96Ek98aAp7+wWofuWi5NYkrWPjhxqQdpPlvTfOX
 zAW46iMWEyiNa9An4hy3h/WGjBfPus7U+vBmymUfaEKp7JFpDPCSRo9r2UEPYPx5kqU4xjoAOvQ
 kwnS/XiDCHr4MZkrGcI9DI0Q3kFcQoha+hg56kHn8CeFvAp8T+gK8Bf4FUdzbh76pgNZeSXiUGw
 B1wMsaPx8d5aBVTgAEZIlrTe60hyQku8HnbV+IkfV4mZ6iRO0by9XI0v26eF5zBJifTXEfy8LTR
 oSEihVtq6r5WV/DPnUyT7pdMTf3YAoFxov9py/UXgJB4yAZQ6smqIBqitwm2Q69/M5qDkKwIstC
 GpPqUdBQPhFGTKspkgQ==
X-Authority-Analysis: v=2.4 cv=UbHE26SN c=1 sm=1 tr=0 ts=6b03daee cx=c_pps
 a=WW5sKcV1LcKqjgzy2JUPuA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=EUspDBNiAAAA:8 a=ukB5r3Mx2XjEV9IxjioA:9 a=QEXdDO2ut3YA:10
 a=OpyuDcXvxspvyRM73sMx:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-23_01,2026-11-22_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 bulkscore=0 phishscore=0 malwarescore=0 impostorscore=0
 adultscore=0 lowpriorityscore=0 priorityscore=1501 clxscore=1015 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611230024

The RPM message RAM is shared with other subsystems, and parts of it
are not accessible to the APSS. It is expected to be mapped as Device
memory.

The "mmio-sram" compatible makes the SRAM driver map the region as
write-combined (Normal Non-cacheable) memory instead, which allows
speculative reads into the protected parts.

When Linux runs at EL2 (KVM with VHE), there is no stage-2 translation
and the write-combined mapping takes effect, so such reads can result
in XPU violations. When Linux runs at EL1 under a hypervisor such as
Gunyah, a Device mapping of the region at stage-2 hides the issue, as
the stricter memory type applies.

Add no-memory-wc so the region is mapped as Device memory.

Fixes: e3f6a6994041 ("arm64: dts: qcom: qcm2290: Hook up MPM")
Signed-off-by: Vishnu Santhosh <vishnu.santhosh@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/agatti.dtsi | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/agatti.dtsi b/arch/arm64/boot/dts/qcom/agatti.dtsi
index d9f4cbfd2861cdc3d9d48d6b5e7d3b7a3206970b..54499f96e88f4dfc2639ea19a6edd692684eec5c 100644
--- a/arch/arm64/boot/dts/qcom/agatti.dtsi
+++ b/arch/arm64/boot/dts/qcom/agatti.dtsi
@@ -1025,6 +1025,9 @@ bimc: interconnect@4480000 {
 		rpm_msg_ram: sram@45f0000 {
 			compatible = "qcom,rpm-msg-ram", "mmio-sram";
 			reg = <0x0 0x045f0000 0x0 0x7000>;
+
+			no-memory-wc;
+
 			#address-cells = <1>;
 			#size-cells = <1>;
 			ranges = <0 0x0 0x045f0000 0x7000>;

-- 
2.34.1

