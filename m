Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 610FD33260E
	for <devicetree@vger.kernel.org>; Wed,  1 Apr 2026 08:56:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775033776; cv=none; b=V6wMe7UPqCiaoFI5gWEEPstwgsK59tKty94H8Nrmham1HLZeeKrRZU53X/BVgKR6+TW+m4dMd2OG1kUQ3i6pICvgYdENKGL9dHItmRnPqGDlLLoI5/q/lCzjcDLJ+lTCMjggC4k77FGrGiKIEdoGUxfYmQQNrVfUxCydWfn8q9U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775033776; c=relaxed/simple;
	bh=Ut126lbH6NWUwD1lxUriuneDo3tZZfq0N3b0jj4pHt8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Rao/S9zf0dMtG9h3El04QA6kz0iiIPVcKB0Zt7xoewAMxFsmHwJ8LDUX6a0GlGAoMvOGxRX1mCFp0EDOg3X6BkoTBSJ1ar72Caz8w9iY9/kldvKglJKp58Tj2Vjyu2qcgjbfMkpG8ZR/pkAR/80uasb9m07r1HhWEO09QtNmeF4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=cGSsFyzy; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ELVNb6Fr; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="cGSsFyzy";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ELVNb6Fr"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6318AbnC1578252
	for <devicetree@vger.kernel.org>; Wed, 1 Apr 2026 08:56:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	eMCDogjDonjJXSSoXenB3Esa0J2VQAOnQzjh6khvW9Y=; b=cGSsFyzyCZG43yUX
	XIAR00CfiCrGPl7V/WRV9ZbyCwFlx69gxYWd5EPHjdLRnRGHD5reMOtS3Anpubgf
	DFOQlvIVP3C0eEDYWEf/4+5RETYpnAS9LQLqaXSci1lG1VKEHp9I6uIU75WRd1rT
	Pde8UdjFkrhXC3zYR+OGJqG9LpMuPBUmIkdS2whIyF7ztvQnJXTYhvt7iTDCaZmy
	RRVewhpgF1ek27F8yPbFqPKSm3o257pM1DKzbz0PHx3+zJYll9iWCHKNAjARi+T0
	I4F4icZYVbhWreIkXsxhjcI8IfNFohZGkNEK0prcJy3phjf27lwjkjHw5EaOZwRY
	+ckMbQ==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d8k6ku7ma-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 01 Apr 2026 08:56:14 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-8cb485c686cso227411585a.1
        for <devicetree@vger.kernel.org>; Wed, 01 Apr 2026 01:56:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1775033774; x=1775638574; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=eMCDogjDonjJXSSoXenB3Esa0J2VQAOnQzjh6khvW9Y=;
        b=ELVNb6Frqs4JCQajPNGPXQSy6z7WLPkhLAJssigTlkqmx7YKExlLmnHX683p7I3Jl5
         7IZeAhgsN5TGgWYbk2cy/qCglKaSRAgNNSl1esxpnUU/ZM3nVQ/7E4LhQAuqQfXJ/vj+
         RqyVp5UYWvXJkU8iMobvEhw07cEW69hszVykiATeQB78WTMq2wdgyGvT49nRN+x5qwiB
         YvfwFFe3WwSrc5iQaYRb/cdcumCJA/b/lp8EW+fi60Gh34sl9ZEOsZ7A/qKQi9Jtdi51
         8cl4N3BC6sXx3L9K53jVuUqGdRqgDWW3b3Ijhy5PSLkaZisOgliyVWShdcevRIeAZtTQ
         X2cw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775033774; x=1775638574;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=eMCDogjDonjJXSSoXenB3Esa0J2VQAOnQzjh6khvW9Y=;
        b=K7uzm/Cutu9hCQtWX+EktKQRtHMoX4GHmbRbg+unssZe7JAVOV9aTMxsHDrUMy9sGl
         rHAzeI+JQfKDJgqByCQ9hiXQaDI1hvZIielt0pm4ny3kyvXZMzYMA+56O9y5GvQSMODV
         T8bmzAwKMl6cm12NnyEIXT7/ISMs1EbjvQOQN9L9DMwWzAEom4I9NEHsWMMdGi9zEAyC
         z9N6DkpPQOjIiRyLwcHD+FisY2bCzjsJhLuvh2OwrLs2TM4mU+odsw6BU4FMASiMLfl0
         VnGvhCoRej7kPNuARgySdRAoiP3DuiEFSA+0xMdONFmgiY8zkTXp6GasQ/ArxWOGYeFa
         AhMg==
X-Forwarded-Encrypted: i=1; AJvYcCUoU9wvJcCD1xEY6pNKcBueI6vzFeHQVpTNJ6F/qnStGM//yY98VaLY9bx6gJpNrSwoDFjFe+WgbeGp@vger.kernel.org
X-Gm-Message-State: AOJu0YzuuC14ngBtOWPo5+a9TI7fvQWwprKb2fQpNg1qdUz69Ld50qis
	s0Ncec6DY1EyUj08HnbIV5jTmpRg7uCllkhBh5UhzSJbXXx9XS60KXy8MoRYEz9gfOnI5Iu01lc
	11s92q8QKHnSYARXlN5AkjOshdQgICc5F8d/QIrgByJgyPbl1KKpiGULA4QEIPn6g
X-Gm-Gg: ATEYQzyFKrJLNIr5wfXkUdYNrbtPYteFmgUrde2YoJho/8pt2pzFLhTt/cLGeDbEeZV
	zn3gc8I+CAc7mweEsp1CXeLYuM8irhW8q2SflxaT7b3thA72M1Gii2AB+wgA4S+Iut6Dhn7y3ui
	8vNduHDkOLv/RNdxtDI/xtbVgJ+x9rlPM0SJcJK3pFflsF1M/qvY5mUKBNxr7qG8BqeQKnjW62u
	SZ1NpoC6+zaQXqJiR4ubU4lf4YmnG/ZqaDOkgV26hG3/Ki8zWke94ezrQx5LM+rtQDmfhAwJTUp
	Ee8K/9dUODbJWlaJfjP87GpxcjiLQDlQdJMCj5IiRd7Vl/2BlHaPm+cGHRqrvypbSLSdkWW5lmY
	OLjHuj9cMxZZDySx1nsYegIB+C9qs/28yO6QEZPjx1/y0GKJecssDAAzW+DfS40EkRS4PW9afnQ
	7h1CA=
X-Received: by 2002:a05:620a:31a5:b0:8cd:8b9b:4581 with SMTP id af79cd13be357-8d1b59568c7mr351963685a.0.1775033773773;
        Wed, 01 Apr 2026 01:56:13 -0700 (PDT)
X-Received: by 2002:a05:620a:31a5:b0:8cd:8b9b:4581 with SMTP id af79cd13be357-8d1b59568c7mr351961485a.0.1775033773276;
        Wed, 01 Apr 2026 01:56:13 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-66c07ab1634sm2394390a12.16.2026.04.01.01.56.10
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 01 Apr 2026 01:56:12 -0700 (PDT)
Message-ID: <c823d6e1-3ff9-4ba6-b972-db0ee737e0ba@oss.qualcomm.com>
Date: Wed, 1 Apr 2026 10:56:09 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] arm64: dts: qcom: glymur: Add qfprom efuse node
To: Pankaj Patil <pankaj.patil@oss.qualcomm.com>,
        Srinivas Kandagatla <srini@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260331-glymur-qfprom-v1-0-5b4284d23c80@oss.qualcomm.com>
 <20260331-glymur-qfprom-v1-2-5b4284d23c80@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260331-glymur-qfprom-v1-2-5b4284d23c80@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=bfJmkePB c=1 sm=1 tr=0 ts=69ccddae cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=EUspDBNiAAAA:8 a=YkLeLEPUqZoZDRCJoscA:9 a=QEXdDO2ut3YA:10
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDAxMDA4MCBTYWx0ZWRfX2WWR/9wut1yr
 A5S8oOmi0GtPXy+gTuF3WphMCYUJjehy9Be3MMAaKXrvSWHhZkJhE5g3waKSmC9z7s58EKdZ1XE
 0UhH6YhfpzLKnH8Ae7cIDI+h5ez4BjbGickqrngH+4y8jPIUexHCFEfJtPEu7ZtExqiwHq0CkYM
 Cu5/b6uFaz0zqXlGhaf/x+EzwmrkW6GjPuKVJySOFGoO4/MpoduGHnR7youUeLfA0JtCrsd+YA0
 UeTlyxVOA8NgWEp0faFmCadb4TInvueE6nzMOdEL7UzaoFbwb/tbjjq2Ks8TTBVLsulJgo/oyZs
 gk6tnn0DTDhgrU2rzwUYzyb19Qjvmrh2+vdGxHr5l05Lxvh04zHHq450YPmFFRtEBgGkMkms85x
 Pm5aA8KwMMS80MPpvpCybcGQ5AYfImQNjEklIVkkEucH4f9v7rtduGGGic9xD2/WzUIc4TgOuOQ
 U1AoMRhOV3bMGL+RDjQ==
X-Proofpoint-GUID: j5qX5bUDBTMOxPquyjhtRFbSDbmjfLcv
X-Proofpoint-ORIG-GUID: j5qX5bUDBTMOxPquyjhtRFbSDbmjfLcv
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-01_02,2026-04-01_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 clxscore=1015 lowpriorityscore=0 adultscore=0 suspectscore=0
 impostorscore=0 phishscore=0 bulkscore=0 priorityscore=1501 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2604010080

On 3/31/26 3:54 PM, Pankaj Patil wrote:
> Add the qfprom (Qualcomm Fuse ROM) efuse node and gpu speed bin child
> node for Glymur SoC
> 
> Signed-off-by: Pankaj Patil <pankaj.patil@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
