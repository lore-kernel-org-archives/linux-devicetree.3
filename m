Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6886175809
	for <devicetree@vger.kernel.org>; Fri, 28 Aug 2026 13:15:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787922952; cv=none; b=fQcT0HEWemZugSdJsb65Uf8lB2LZv3Wf9zB4tbejTYuhj0cxSLYnZjMugsgC8WzDVLxiZWi/BVDl22XuveMm7p9zBXgNMtmSIrYv2+9x6bSUU9drRBWpQKqwZZotsN2DVyDhmxXB7LB/zb5W6xOzYNkyXlgSW3aAsV0eyLelpMA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787922952; c=relaxed/simple;
	bh=iePCwxtbzLSdZC1CQ66MmSNEzBXjyySM5S55IHQlS0I=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=W6K53Ni1syphGB5eiCfH83IRMkC7c/aBqEqNnPqwPmvig9AmPQhq8qlYTtXWLsrYlMDG3i6KEz3WpOX0u66N0vcxjxJwKy6RHOwqiv0LHQsmHOpjNvj+ScCpsEKizraSDxRYKhnqfM+ftX/dxcYNquRqWfcWrzZuDcI/cjTdGJ8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=AvvTGBUp; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=FF7X7I+/; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="AvvTGBUp";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="FF7X7I+/"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67SCb11Y1906554
	for <devicetree@vger.kernel.org>; Fri, 28 Aug 2026 13:15:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	kf2gNLK0kyVT47HLDz9mth3TS9O1NFFYC4viST6weVM=; b=AvvTGBUparWamklC
	OOSNQ20TngU3RSWyETRpCQ43xrF6+As4y/JMCHxytpUWxc5zdKG2if/ppy7TeH6F
	8JoA0OiuwFhXmBZiRT/16d4kPM9iptm4fgrkgaQdT/9NdWVwMoSGAZ382FfwloUZ
	OTPNOG956WdudxmTDWN6JGWtv+NSammzQlV6ID45JntPG587lGACzNcpnr/sb+av
	b22v3gVzjV3iNMfXCNdG2bpud4fUEFbooHgpSP8otlAOXRFbb48WO4uvgKl4ZL3v
	pUQ5i3+KE+20nn6c1zMwGdWdYlaTW3NpjYnk7M5j64wCu3yFyxGs6DM2Jh2/lpMf
	FoOKFg==
Received: from mail-vs1-f71.google.com (mail-vs1-f71.google.com [209.85.217.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gbag9r438-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 28 Aug 2026 13:15:49 +0000 (GMT)
Received: by mail-vs1-f71.google.com with SMTP id ada2fe7eead31-737ddaf8c57so18162137.0
        for <devicetree@vger.kernel.org>; Fri, 28 Aug 2026 06:15:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787922949; x=1788527749; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=kf2gNLK0kyVT47HLDz9mth3TS9O1NFFYC4viST6weVM=;
        b=FF7X7I+/h6U2Q8FkIQyunOiDW3ri+CJ075chZOZ9oLe+PyE4S2mdpJqTUBDpv8jHG4
         ngV9IEtP6n6ucIFo5dGGOlx9Rx0uIj4dRrDLys7WPeolDamBdeM++/3RGMk9/pH9H70U
         77iLQDQpMHfw+GuRa2CIQEBWJHdEEE4mh/hpyEMC7THN2o8RpD3FxwUiZGFleupO5+FN
         GePfRyJ6KIWa5DudDHbk/Mul8uwulc8Jwr+iWp7+lTrY0e0DZtQw1hSRldkmkuIsmYtw
         je4MchUn25Bvf/TtlKtIB/j3eWta2StWOo7SOgFJe7WaG01ZeufPXoI7NonzStaUM6oo
         Jlew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787922949; x=1788527749;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=kf2gNLK0kyVT47HLDz9mth3TS9O1NFFYC4viST6weVM=;
        b=OPFOTSrARaZzvrVozRhwz8hP8Rr7VvQER4HLdRW+tCOMWO7uIReKAtS5+mu5ei2Aw8
         6ugnUfiRdq1hT8r6ujEfDrnonRJZpiQ57UTy4YWdtNVLC07PXwCnkR+NhtztXTC0GrqQ
         zGvsHDGebMJ1rA4wwt5HKkNtXuW/AaryhlTkxKSOdhSc7DLegaDVmn1HuexpuTUn+7Z/
         i00Hdb++Kgk6X5pq99jX3V+pRJrcyYkDeDU5PopzKFD1l25nZQ66GXwSEXNqnKOF0KJk
         adKMT0INb91B2eintb7qZOwzETHritJU18ZfqUHSOs6cNVFrVg4UGG4scIkRxbnra5OC
         MhMA==
X-Forwarded-Encrypted: i=1; AHgh+Rr4Z1DdfwDiLBcprjA2XsFkkcdjpuSe7cwQ99F+rEbJnDyk6UmM+p1P3ru/zgU6bmZfqKY5lelXW6DD@vger.kernel.org
X-Gm-Message-State: AFuF++nh5VFRgM2H8KEzBxlCLfg6uzQ2b1bUXkJxFhNFb25Q3faWkG4D
	85kto2shb6WaRXir8vK1uRWGkpzNQdaBrI6ZlC0OPjDB1cpVZoYil0ixJD47nbIGlCCDBjS2Pqk
	9sqO20z/zRFORoO/iurodrqN+IKPIsysL6Ymc1gTPuOjFfMm+uL+1Ud6+ktGUGxSgivODzATl
X-Gm-Gg: AR+sD13jw001gfQMHwkhwdp7wGNdA6CR4ub5UhFKCme004PqLzyREVVy+udh/fxoadT
	an7f822ek49u95755WXIKKX2kp6Nxb3vGQMvwsNPhqNWkPbwUm960kuFUn5lr82GeJ0Z4rYZx1u
	P7f9mqJPVglMKomJQsouqWx2Zlmi2ezn0n7N4i43GdW42ZgzGb++RCm7DEPHwC07XHJXfWa2GhG
	y2WcDVZRIwMvtRlPVlia5ao9D4wAZ00+IWpli6XtAAlxSXG2ZAhCRu3X4fr7O9h59wtbN7HhAG9
	YpTMsiNuILYztjnfVSmQInmJMSi0yUIrxSLNn4HDTAzXb6i+5yFDg3SnGSE8Z8ykWlbX6naJPEk
	Mg2HYHRhsiXcqFIWfv26MNh8=
X-Received: by 2002:a05:6122:6b86:20b0:5c6:56ae:2534 with SMTP id 71dfb90a1353d-5c681519d46mr752300e0c.3.1787922948809;
        Fri, 28 Aug 2026 06:15:48 -0700 (PDT)
X-Received: by 2002:a05:6122:6b86:20b0:5c6:56ae:2534 with SMTP id 71dfb90a1353d-5c681519d46mr752259e0c.3.1787922948209;
        Fri, 28 Aug 2026 06:15:48 -0700 (PDT)
Received: from [192.168.120.193] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c255f1fa3ddsm78819966b.45.2026.08.28.06.15.46
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 28 Aug 2026 06:15:47 -0700 (PDT)
Message-ID: <673359ba-7249-4e0f-b5e3-4c729d4fe6fc@oss.qualcomm.com>
Date: Fri, 28 Aug 2026 15:15:45 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] arm64: dts: qcom: sc8280xp-x13s: Enable HBR3 on
 external DPs
To: jens.glathe@oldschoolsolutions.biz,
        Bjorn Andersson
 <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260827-x13s-dpaudio-v1-0-da73414c6ab5@oldschoolsolutions.biz>
 <20260827-x13s-dpaudio-v1-1-da73414c6ab5@oldschoolsolutions.biz>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260827-x13s-dpaudio-v1-1-da73414c6ab5@oldschoolsolutions.biz>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=UalhjqSN c=1 sm=1 tr=0 ts=6a918a05 cx=c_pps
 a=P2rfLEam3zuxRRdjJWA2cw==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=gxl3bz0cAAAA:8 a=EUspDBNiAAAA:8 a=Uer6SED5Sbd5OPh8DIMA:9 a=QEXdDO2ut3YA:10
 a=ODZdjJIeia2B_SHc_B0f:22 a=kiRiLd-pWN9FGgpmzFdl:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwODI4MDExNCBTYWx0ZWRfXyNoHfyUFxqUW
 ylfj9odxkKiZoNhXk8iOAyU1ylfDvE0f5/1qQ70RCKffuZj5C21uOvhxfOLymIZNzsI2DcE7xdd
 k0cOjKuMtWlG+EEiehED7lGiENLq4qQ=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODI4MDExNCBTYWx0ZWRfX5qBtLbX7nsSx
 YVhu6yjXsaft9LwiEEpx6yYNMPQWCCNf/gRYs4IhmHfk+0kjiGcF+FbOb5tM938AjbBMCDgyO9J
 CMaFSsIQZPCTYTXaW5+5M8ZS06LZeD8F3MDqG5UXRmnC0wH+9KIo83/6Hjv4iwZbLP2GnVUNnjb
 lZ4E328Y9nWgf4C5nw84IQtyxG9ik0nUSWFKPEWWFrYNX6CYroQqZ/BfBqs1H08nNsobzlxjyd3
 D10HzF4fM7/ZoQPmSH9sG1l8YFE7hTy907h7eo4o5Q4r98N23vV0QpVyr9azxYP1zKITMpGYfaq
 IEpeGyN5+EnQ3l2dyQGFk3IZSHPzKbR77hy++9ssDD58d1KqYTM35YBkoEiT7OwTXoJWT4lghBF
 hRt1Z2uFzvZc2pn7foujU8a5W0qGjJFxjNdiJvffA5390wumYkjUZlVhC91FMXtZUVPmPZM+H1l
 hVBOsjY2AAZlZgVQvZw==
X-Proofpoint-ORIG-GUID: SQq89V3499hOVI9x50W5MALjqcOf-KEq
X-Proofpoint-GUID: SQq89V3499hOVI9x50W5MALjqcOf-KEq
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-28_03,2026-08-27_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 bulkscore=0 clxscore=1015 adultscore=0 priorityscore=1501
 suspectscore=0 lowpriorityscore=0 phishscore=0 impostorscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608280114

On 8/27/26 9:52 AM, Jens Glathe via B4 Relay wrote:
> From: Jens Glathe <jens.glathe@oldschoolsolutions.biz>
> 
> When no link frequencies are set, the msm/dp driver defaults to HBR2.
> Explicitly list the supported rates including HBR3 (8.1 Gbps) on both
> USB-C DisplayPort endpoints so high-resolution docks and monitors can
> train above 5.4 Gbps.
> 
> Signed-off-by: Jens Glathe <jens.glathe@oldschoolsolutions.biz>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
