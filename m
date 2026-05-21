Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E3853348C47
	for <devicetree@vger.kernel.org>; Thu, 21 May 2026 08:57:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779353831; cv=none; b=NQZZELGHSP6Rx/ga+F+vMW2samJGHb+7mrQIvu9V923eKrgclGoUgoRZ39rHT36FvS9lJwEAAU9GfEszMlcfx+ENEWM/UPwMFftM6ZsOeXB5wvmMK3q36p3ZiuDFa7eosCTEdNC0GT1EJpd3Z49u2tMXcXzonhJ74o+q+n7XiPw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779353831; c=relaxed/simple;
	bh=jR3Pgcb9LH6HV2M477w0hTjs2PvXoiYFJoaFnl+5K1k=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=pGKM5YVSjTJqPSnVbi8XRTcetk8BwXUG/G2u5W0QpKORD+0IzNq7Un/qGPJlLgEMPXGzlyaxoEwUU219WdjXRMkjdcFLzUMRb6Ih+twqQnKQVzHutdowCkSWUl/hUTKoouauBUt2N4rTrK1+Nc7yep83rvu2OMM+c+s0m/vFlic=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=FYdEKVtb; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=gv1cN+HE; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="FYdEKVtb";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="gv1cN+HE"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64L5MKg03084922
	for <devicetree@vger.kernel.org>; Thu, 21 May 2026 08:57:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	UZn92Brk23c+Rkdb8x9LPoHnZ0R8K9ZZhsAXkeEy4co=; b=FYdEKVtbXg2Je2Gf
	1yLwj+HJ0mafhil1Y7DCB2h1IUkmqIkGt8Y7/jVhsIIACHQHAVDb1CPIda/OMQMI
	4Nuo18tWRrHVRw4icS9pud0lMfL0KoiIgQylHgVqZtb9aMji+iJOftYyE0tOMWJB
	YfcL/BhLg6EVr8ovb3BG6+FCWgmCej2FMeNCsr/uiJtEmnuC8rs3DSMXmPt/JI4g
	UxOZIawvcRKNamIpJIY0MhPfyS9aJGtzmlL8U2xpXs2AFPIO/IA80kNf8mzp7X7f
	e9Krffrb4wSx0iMbxd5dg/BZOYQz0NUEicbNDG4kkEfQQ9H+wbuwWCiqI7GKNEIN
	A+reDQ==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e9c7f4hn4-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 21 May 2026 08:57:08 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-8cb39de5c54so142841885a.0
        for <devicetree@vger.kernel.org>; Thu, 21 May 2026 01:57:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779353828; x=1779958628; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=UZn92Brk23c+Rkdb8x9LPoHnZ0R8K9ZZhsAXkeEy4co=;
        b=gv1cN+HE0P0fKZQ7b+vbrRuBZjVsvgtP2RDLzFa1ghqEbf9Btxj7QcZEom1ndky4wq
         z7dNMZpmGYejPauttH+aaxIZJY9uykziqefMPpN5IHweWqhGxGsnbP0vMrkAzk7LSm78
         5NODOn0oTpl3mp8i0I7oz4U/LHncb0Jg/j2s2uWNFq1ei3y3yxekSeNdRNWp5rNSgcJ2
         mPWiXortqec7ZBCIB1rbQ81yStwI96M6c5dYeQoK2qv0jTHV7wm+BOCd4XZOBbC2yoY1
         yR6nVKoY/+94lkFcCyf//ZwJmet6vDjyh+s/tVuWz/lfDE+gi4KAg4eNle9/TvuGvbec
         wAOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779353828; x=1779958628;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=UZn92Brk23c+Rkdb8x9LPoHnZ0R8K9ZZhsAXkeEy4co=;
        b=epJhIWWncaW8JaD2KJ1+BhaFtIiR4CglqCXIFAKnJGXNXu3x58SHbu2c0dZJG+udid
         KO2z2mQiBZn0jJ64x/hboJ1o9+ezTGyg/8vcuiHgwCmwGbjZtg9Lf4goJhrTjNOmO+xD
         rQ5IAyBG/TFKa3+XKqzxO73e1w1Spf8NQdkbU9dXKDD5/Rk3+2PB66JmWM9BQA31WvOM
         2rutFJWc9dcGP2/KgD4556jXbTCg8rZ+WJPkA4BQd7pLws0zURVTAaqfyVkY/fc0aeZD
         fZ5YiwjrBioci8jW7SDaXPhdoOEVHKsru5/S2TRWdhWBje/B7Tq/BWPYy5R2QE7yEGhY
         7C5g==
X-Forwarded-Encrypted: i=1; AFNElJ874WS/Dcv3tiISuioQhWUCK020PH4xHdvsHN0Y2rGitVecMf40mDci7E5kFuaOEhVHIWypV4SYy9uC@vger.kernel.org
X-Gm-Message-State: AOJu0YwtcTTvEeLLcjs9afzjZ02XFY0MOxKzc8UASD4flxsZotC9D4Xk
	iy7Wq+LaF+xxaSUy1OSWkCHxAn/dSh0/jwba9vwqy7wJa/vV7f1JDwlax4nfiMoOjxgRzKlOqHA
	07mGlmHWWVxjrSk/fcK7//2EEMyWNY8JBWvgJWh9rxL57fitPk5h99DLCzHMINwos
X-Gm-Gg: Acq92OFcoODN/Yqln1DavTQv9/c13IUvmxWLDG5sUtKYOD+amqaWJjlN4L4lcdothbU
	SE2mxIm6ZEa491aFoVUMtUr35/OFqcEpi+XyccSvlPW7bdkzhG+2LGHaSJoGkG3Qsn5JMeanSNz
	ffaHTdxYtR6212b8v61LDUOTvlmipJTYT5r6K4eRD30ldVshEWCHA5zxzjwKG2Bo78UCcNpk3ha
	9H4J5s1sUztRVIfjocy9evpgOTp4waawMO0FHVYnNJGJGnBMbt+V+RVjbIzWzjzMJlyTMtCcKmO
	hwB6JUWE9PeuBfSDumsYIs2sPJfQMRB1rEXxJeyNEE00nV2mX87mpeYN2M87meS76svlSfPDySk
	zedOEoc3SH2KXjSIBUcC/qIL38BnbuAi2arPn8Qbit92lTc3/mknQzpTvDGqrj9pP8lGqzhgzo3
	UnaBA=
X-Received: by 2002:a05:620a:f0e:b0:8d3:f6c2:5196 with SMTP id af79cd13be357-914a2d1f98dmr155677885a.5.1779353828093;
        Thu, 21 May 2026 01:57:08 -0700 (PDT)
X-Received: by 2002:a05:620a:f0e:b0:8d3:f6c2:5196 with SMTP id af79cd13be357-914a2d1f98dmr155676285a.5.1779353827601;
        Thu, 21 May 2026 01:57:07 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-bdc88371cc5sm18301666b.28.2026.05.21.01.57.04
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 21 May 2026 01:57:06 -0700 (PDT)
Message-ID: <50ac0298-7cb3-4692-913a-761f38da455b@oss.qualcomm.com>
Date: Thu, 21 May 2026 10:57:04 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 09/11] arm64: dts: qcom: sc8280xp-arcata: model the PMU of
 the on-board wcn6855
To: jerome.debretagne@gmail.com, Douglas Anderson <dianders@chromium.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Jessica Zhang <jesszhan0024@gmail.com>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>
References: <20260520-surface-sp9-5g-for-next-v1-0-9df52552bf87@gmail.com>
 <20260520-surface-sp9-5g-for-next-v1-9-9df52552bf87@gmail.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260520-surface-sp9-5g-for-next-v1-9-9df52552bf87@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=c/ibhx9l c=1 sm=1 tr=0 ts=6a0ec8e4 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=VwQbUJbxAAAA:8 a=KKAkSRfTAAAA:8 a=pGLkceISAAAA:8 a=EUspDBNiAAAA:8
 a=S3QPRrZGCkirkA1mjOoA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=PEH46H7Ffwr30OY-TuGO:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-GUID: vVvlIxZLopMnkuqoqM46HZmfk7hNIL3l
X-Proofpoint-ORIG-GUID: vVvlIxZLopMnkuqoqM46HZmfk7hNIL3l
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTIxMDA4NyBTYWx0ZWRfXy3XTcD0sqqOV
 YtecZKQRKfncfT6h7wLjT9u2ZOGTyCCPsuFUCv8EQYkYh191Ob/wvLI+X/GINZrdMYweVocjjqy
 VCLkfru/XW5865TDCQj4fgVlCe1o3sCaY7tNz9q6lVktgLlCMUXcgtt3Iak/Sp+0nnmXnwPKrhl
 RwFo3WUrFj+i+j5Eus8JpJXlMrZE0aUH6hinXlLsK1uQlgdzZ30AVoEdM7qRQG05CRxMevrdl+E
 JJz2kE41BetvA/zUsGR7HbjnA7WaV1L2HEzGkJPvDMEfJS4UlrtDcZAVhX0aIJMRjiqFpEBc+TL
 BC9KQ6RgXyuiGwIODjJEg4Pox3YNk+W51Bs1GXVXvg8McRyQmOH7ZmQeeMV8e1vBPYQ8W0Tjbb1
 C77nfwnlUuRk2bscT1Uc/jDkwBpqrO81W6heAw4pTTCc3hP2tM0SxoGHjTcmqqwMYmSjZKbGtsr
 kg3lUrTqRHk/4SPGbCw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-21_01,2026-05-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 spamscore=0 priorityscore=1501 phishscore=0 bulkscore=0
 clxscore=1015 malwarescore=0 adultscore=0 suspectscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605130000 definitions=main-2605210087

On 5/20/26 6:40 PM, Jérôme de Bretagne via B4 Relay wrote:
> From: Jérôme de Bretagne <jerome.debretagne@gmail.com>
> 
> Align the Surface Pro 9 5G with the other sc8280xp-based models as done in
> this patch series [1] from Bartosz.
> 
> Add a node for the PMU of the WCN6855 and rework the inputs of the wifi
> and bluetooth nodes to consume the PMU's outputs.
> 
> With this we can drop the regulator-always-on properties from vreg_s11b
> and vreg_s12b as they will now be enabled by the power sequencing
> driver.
> 
> Use the fixed BT vddrfa1p7-supply supply name to align with bindings.
> 
> [1] https://lore.kernel.org/all/20241018-sc8280xp-pwrseq-v6-0-8da8310d9564@linaro.org/
> 
> Cc: Bartosz Golaszewski <brgl@kernel.org>
> Signed-off-by: Jérôme de Bretagne <jerome.debretagne@gmail.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
