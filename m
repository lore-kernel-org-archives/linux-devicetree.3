Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 04B5F43CE6C
	for <devicetree@vger.kernel.org>; Tue, 11 Aug 2026 10:19:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786443559; cv=none; b=hg4iR4QB9GYqZOs6r1/tHvxxU6j9qmSbxqzPSFBX8qCvAE+kmC0JjLfuccfC76PkVL0OBzClI6Pee9SGtI+MclBIiCrUvWU74zC+ktp35SH0QBVbfihG41jZflM3iYAxXI4LFYp85KrH6jJ9PdJ47G0RSClbwAzr18uXwdTMm/o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786443559; c=relaxed/simple;
	bh=yIX0AZeDSBCxEM283ktfqzeqM9UC6TznRuSs2kcJaBg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ZmTsm9c3TzDmJhAApQxm7HrWniJWZ3CYOWDqYeHABUTaARgkqboT/c20uMIVxOIrQ7IGYTo5m8amysiv1yBojEgiPCsrku3WaPCqUW2r2yOWokyKOwWV2+4xEEx0F1lQMKq5leDGgH+Tsf6JifEL5UK7/f0uur+ZvyjnhqWzIoU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=aEqFXb/Z; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=M8NG32OC; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="aEqFXb/Z";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="M8NG32OC"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67B6W7Ol3307910
	for <devicetree@vger.kernel.org>; Tue, 11 Aug 2026 10:19:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=OkJhmhbIilLQammOt+nQdb0o
	o0r1qouASRnfUNYThiQ=; b=aEqFXb/Zb/AcfX4XwnYbi0fIRplVtMEbl7bPsWPU
	6SxB8AVHa4apVJIHtqBA2Ac3mEf4lMpoHGIgsihAli5yIScg8OAf98Z8GAksw/9B
	wp/sDmPFZ9Wu0OhG2hPaUMJPzhtVKQfdjyige1dvaJqq3hF5iCyo9XBjhHXiFmFj
	2hZmqmh4zTaagp3CPWyu+wCQE4HPwC/MUlCMgVVRbPt8x16RKnJKcy9RpkWHD9vG
	V7WEzXd1tST7m4ZzD3zPD0vzZKvZZOyO8KsTI939rLmrfipyjCCZZOW8ic6N9f+z
	ye/Hl4FSBYv7U9Vu+SSTDv5Fh2qizoeQcDsyIxMbmDnnxA==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fyjyfuj2p-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 11 Aug 2026 10:19:05 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-51c1d7886cdso53703211cf.1
        for <devicetree@vger.kernel.org>; Tue, 11 Aug 2026 03:19:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1786443545; x=1787048345; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=OkJhmhbIilLQammOt+nQdb0oo0r1qouASRnfUNYThiQ=;
        b=M8NG32OCxKAsGg285+eNiXR2ELxCxmxzX811E2c2HF5QMskqyan/WMHqMMCHqKYqIn
         SmW+otVDMOtKcm12dDLhHg5OZE4Adyzx2DMH4jMAjbncmi7akXIbv8AywcPJUUMOidJw
         SqYyg6Uu200WiqwItT09H1jGt8tcKU6s9Jmz+wCr6CLNEjNuFUediH4Wow5+Y5QDol4X
         DshWe1vsaiEFPS46/fdwGgR89r0IJSjnKS1JFcYMZeXqBCeU+ljr7+kosV8k2NEg64W9
         LoB22Zh2I5CprkivtxCJWPr1mIONuIu9od1I+m2i+LDJCErgqHbGb4A7TpOJgsQX4tX8
         l5Ug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786443545; x=1787048345;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=OkJhmhbIilLQammOt+nQdb0oo0r1qouASRnfUNYThiQ=;
        b=VXKUPRcbdeWsspMbjJHch52+SU5Gwf18UNfJZlOgzI2eSS3ati1VVI5remJAx6z0uX
         w5d7qwmnkcRnX2wGqHtvzRHdqNrd2+ES9Mn9oM6XRm6MgBCD+zXA8f9XGPphm+g5F+PK
         XdAu6ESF3WSddoMXbFUas8o+JrAt4AoSzbPAG9w/Br2BLPhr2xDcgt2/M2YKd1TLP/iw
         0JkUQOGrH7b/vvfNT/0N8GVq/mp5spkadQRtebe9ZwGjd1rZ0emSk9MtqI80+4WZ35iO
         f71F1WHRKn0I6ZkhscMKCjNHloZ3GO7lNoLFU+ONfaz3UqWE9V3Z0IHC+3kB0VtBogr6
         /5wg==
X-Forwarded-Encrypted: i=1; AHgh+Rr71/Cbro9B2yfeLt7esnHrDu+fbww1V044Ky+sFADYrjLEISmhE7Ezj+ssIMkEkIJeRiAxghBSjnUN@vger.kernel.org
X-Gm-Message-State: AOJu0YxwfKRTBMV+IXGoBHg2MDFOlE0mJQuZfSvxmuRsrL3Q6z90Qus2
	RZVIGm1OXfKt5VExiaxNOVTM3SCDPhkdg2EyVqF3hSrUKz3JuKzIPXtA6MqA86jFLMmcqkZbMxr
	X81H6tuXVD1TWS6CcBaiPoX+sY2izuyHWS5hVHL4iYQqeD4rmekVEv/nJpkWKBZOg
X-Gm-Gg: AR+sD10mbyPWbhsUTW8ukP5RsKP6CBE/rUHhsz3vHA4pgQLirHKtee+Z2kb8fZckamW
	f2mcuVammMnalzi/A64suVUuUJ1l3Hn49PIJ/MNyUAo0mvJvBwlEUhZoTJWGTPE7UGGN44GteNd
	G0XQp0vsx4n5+C0SfnOG0eFwyocJpPQDZ2znzMQZoXzL1Dqn/xndH7TT1kF2D5pmm5r6Z4w48MI
	kcxZiw+kzeRm4D0FLegqphQsUydBYsEFjyEv4SjfKHzRsuNJxlLVrMFL68asBWFMdsjeM2vZCov
	fPCGPFWKpBPiMVYR6LWKAyiE8drLGJ1e7uxkpGsu57QmlTSnbTzhoF+8FcEdx0PRuBV7zhFXu/W
	Db3aO30tC1LMvnLYhI6l1IoKRZ+KUUn2nNQeYCTEeFdjCUBFPe2yzApsZzl7PjEXLATMUyZXY5g
	1Xx2i74PyZvuvNfw==
X-Received: by 2002:ac8:5f47:0:b0:51c:a70:5ed with SMTP id d75a77b69052e-52d586365d0mr15297721cf.30.1786443545257;
        Tue, 11 Aug 2026 03:19:05 -0700 (PDT)
X-Received: by 2002:ac8:5f47:0:b0:51c:a70:5ed with SMTP id d75a77b69052e-52d586365d0mr15297571cf.30.1786443544894;
        Tue, 11 Aug 2026 03:19:04 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3a0fa3fc5d2sm1729601fa.10.2026.08.11.03.19.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 11 Aug 2026 03:19:03 -0700 (PDT)
Date: Tue, 11 Aug 2026 13:19:01 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
Cc: Georgi Djakov <djakov@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>,
        Konrad Dybcio <konradybcio@kernel.org>, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-pm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-clk@vger.kernel.org
Subject: Re: [PATCH 1/3] dt-bindings: interconnect: Add Qualcomm IPQ9650
 support
Message-ID: <n54sewn4sjafsncs2e64hkynxr5ct7qh3xukmgvdqankpsg2iu@kunxe57navul>
References: <20260519-ipq9650_icc-v1-0-4d3554c94257@oss.qualcomm.com>
 <20260519-ipq9650_icc-v1-1-4d3554c94257@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260519-ipq9650_icc-v1-1-4d3554c94257@oss.qualcomm.com>
X-Proofpoint-ORIG-GUID: k2YLCK4B5q1e_-pPL4cGgrTpqfw0D1Ov
X-Proofpoint-Spam-Info: AW1haW4tMjYwODExMDA4NSBTYWx0ZWRfX4HQ8Lz8G1/sq
 sS5RGXJ5OCMKC16Fv1vG5MyhTD4sui5N1otTb+ShatwWetway5Mdx8J1axP5bI/KumLFti5fW2r
 P8utWdJmatbIAnArC1ov7KL8zPBuSQ4=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODExMDA4NSBTYWx0ZWRfX6mP7XhfFm03u
 kcDe8OY4qikepefxxN8cnxuYDLarrnEdP3aIGNBHEdGE1YbAbzF1qliTualnvkiBFqnSeeBoZ0H
 h2uM3JfgASrzoovX1KC7OTzku3UAZVuzifTOFQ+2tSVVu3avuOE5UPulSGCCLjIX/XkvDjaKE23
 9gMjsS1Yy/+HEdcDvkZxL+jk47Odjs4LuS5zrM+ka18hRq+5divLqWyEa5Vq1/pNOvXVqYgfyS7
 kvvS2KRkARgAlSqStJ0Xh8bnGvp7BOkDYthw4aKe4KIHLP6XyaOEHRuEJmojvareatDL+Bsyv71
 ku0CGkFcp0emT5aTPsU3nlPQTFOAAcPJlKoyMl6qfGNjrMN1yZ/IAj66WnQigS+IGaOXzitCIIA
 Xw3g+QmjLPuRSc7BMSVctJ5HmiUNEZpukB6AtX34Yhmd+5Ysb/qujC7GVMpK+9mzqv67Rhxe50F
 WwHcSXcLqa7sWHkKvrA==
X-Proofpoint-GUID: k2YLCK4B5q1e_-pPL4cGgrTpqfw0D1Ov
X-Authority-Analysis: v=2.4 cv=Zd4t8MVA c=1 sm=1 tr=0 ts=6a7af719 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22 a=EUspDBNiAAAA:8
 a=Cx5HlDUoyQ0isXJhYOIA:9 a=CjuIK1q_8ugA:10 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-10_06,2026-08-10_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 impostorscore=0 malwarescore=0 suspectscore=0 adultscore=0
 priorityscore=1501 spamscore=0 phishscore=0 bulkscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608110085

On Tue, May 19, 2026 at 02:17:05PM +0530, Kathiravan Thirumoorthy wrote:
> Add master/slave IDs for Qualcomm IPQ9650 Network-on-Chip interfaces to
> support the gcc-ipq9650 driver in providing interconnect services via
> the icc-clk framework.

Please consider adding an explanatory text.  Something like:

On Qualcomm IPQ9650 platform the interconnect busses don't have separate
RPM / RPMh controls. Instead they require direct votes through the GCC.
To unify hardware descriptions (and software interfaces) between this
platform and other Qualcomm platforms, make GCC export corresponding NoC
clocks as interconnects. Add IDs for these Network-on-Chip interfaces.
The GCC schema already defines #interconnect-cells since it was added in
the commit f92b778251ad ("dt-bindings: clock: add Qualcomm IPQ9650
GCC").

> Signed-off-by: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
> ---
>  include/dt-bindings/interconnect/qcom,ipq9650.h | 28 +++++++++++++++++++++++++
>  1 file changed, 28 insertions(+)

Georgi, any feedback from you? Would you ack merging this patch through
the Bjorn's trees? Or would you rather pick it up on your own?

-- 
With best wishes
Dmitry
