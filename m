Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E54563D1CB2
	for <devicetree@vger.kernel.org>; Mon, 20 Jul 2026 09:13:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784538806; cv=none; b=cmT9C9LQoCYJ+KQ6VppNmUREA5Hhh9L0/EjlnMpBtECxBZnaF8aavYRBxwN9BsiB3FsK7hTCJi1LlD95qxqjY2uFXnZBhB1C7E36INMdxaH16ypqArUY/4yINbmfxx2n5SkkMSf5GEW1XHaPl6AwB3MiOq2O7UlBQTPiapJTcuE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784538806; c=relaxed/simple;
	bh=20nn5wJeDlF+hmHrrk4IsFjcAIFgDZlGRKYPV5ojj1c=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=mlURngY69EaSs5t04SXPXAtDsHEgDXb34iXNT+iFFDGcC6PcLIBY7PH28bm34MXBMkkxk6wfdFhhMc/uYEFSjNgITHYKUkh0di7O+PTeQsjSY7fzMR4EVTti1RFkp33Evr8LuL0gbkT51RMgQuIi8ee7wB4TZ6/WnJ3I2Hmr3IA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=AVn8AAFk; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=dTHvwv5N; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="AVn8AAFk";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="dTHvwv5N"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66K6RgqZ1774809
	for <devicetree@vger.kernel.org>; Mon, 20 Jul 2026 09:13:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	KgY2JyzUmY92NsilhAYHcDIk6+jUtLSlAIUQZcVPdZo=; b=AVn8AAFk5KepBkvN
	hv7VUz3hvMpyv2FMSVC3Kcl1RGnz/QEj8S8CnZMcAEW+tC+LWd9/S3RVrkztadvK
	C4w8TOsafvKS5flgx1YKMAXogbqc7YCSIBozMDLHpRe7Ky76ORhdgeFOFpVLDJqM
	HGmUoJGNL6UHzpRrhe9+BCjveFrmEbd95KpNr+T5adNov4wZ4tecQRfBAjiljiM8
	61FkqUkidXiY/yQFg0OiLppTkw0sUx4nf8iB8fTUzuIHRjBVGvXPGcEIucPIftJM
	TmTr57xxlNz5nfFWajOLQCtd/+xVjqeawxYxj1IiLBPFww0IONa+qGChWNRfpqYN
	ec5b/A==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fg2af5ec5-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 20 Jul 2026 09:13:22 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-51bfe75b7dbso22200481cf.3
        for <devicetree@vger.kernel.org>; Mon, 20 Jul 2026 02:13:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784538802; x=1785143602; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=KgY2JyzUmY92NsilhAYHcDIk6+jUtLSlAIUQZcVPdZo=;
        b=dTHvwv5Nj1k1HrNCvgocS9gJbN0ps4YFrBcqb3/wgrjMJKixO1gpZJhg3sVWFDEaXR
         XemynN++g6OsZKGRp2utHy+JugLi+20GhQBfa0JQWq+zE8WTtKeUiNDvN9yfi2zONvTb
         d1xu1XkQGiR4jLBz1w7+sNrCTygz1WPAeZcA+nKkaxeoUXYCH9c7XDhadU6MJxooxbJx
         9aKQO31dg4h6wusaiJiip2ojcWBZbbRDbGg6/2sB26Xm3ui9GA57UibWEOmzWhZ76y7K
         H1bRpKHX5k+zVrSgX4NAmrhuZezJ1v2ko+Jai2x1BFdi4NDENaK9Xs4IwQORG0yw+IqK
         +/cw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784538802; x=1785143602;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=KgY2JyzUmY92NsilhAYHcDIk6+jUtLSlAIUQZcVPdZo=;
        b=Vhr1l3piYBQOT81z4RoqmMCTe8JqevvDJ0Wme9inPvhisO2uYcCkK3pxYYVxElqYe5
         tX/S8mgfX5D3xbAS7HrsROhC5JXw1elkQpmF5CwIBJmuLzX7NCpi20cl0CV5op3Z96NW
         1uhjzvrFO3T34vZiK5fjRKV5gdPqWkYyAs2qyBhzI4sCrcW8vMpSVOFci205v+xacluE
         PwC3fbOBqEs5DFGxol2x2Aups7tydyPgkmZC90oI5SWLUNhza3XXJk94WxaTfpI8ofsR
         apUgudVRSsaaOIVlYygJPNAsK7LXx21XDb/ifsC/4WQeJHrrwnzo2ehDQOn54+rNjss4
         mRZA==
X-Forwarded-Encrypted: i=1; AHgh+RpjGsqGVEbyxMUGp/gUHuz+R7/mm4DiJTRKFjjZOn07fSdOmAgj3rGRJg8RMyXGtK+RsM/jgqJT405/@vger.kernel.org
X-Gm-Message-State: AOJu0Yz0QQ0vGEycREy0gizcrRThSkhqKQyTKUiqQ3rLlXDWi4+p5VFg
	3BcuzaeemKFV7+fwC2OXlW7vu0cSTQTeJSXoeH8dtXtKxfqBM42Xx3/URaEiMNdTVQv2crcy8Bd
	h3nlp8HBMatBrPpGrn0c3f4LuYMwLp5WxU+/afkNslD2pznX1PKo8mRE+FFMLKT/S
X-Gm-Gg: AfdE7ckLhWF9V9f5Dnoq5TnfI88BD3Qk6uPAHiUWrCH5qX9mKFnRrOq92ZzJ3FDLkOQ
	9kGUhon1wGUxYOfi6JaXtsIfmvze0NKHsXhNLupHMzmMuLC+l6yphIff3ttmcqYMWldMJYFRJlZ
	zKklQIGbP5X648woDGZIPMK81JCpikRuhs9DWq6RL2Et4s89zbm7GngbDZNzsOAcxaiVE3DNblI
	Zqx6XZW7bs9bDWdn46cijyP9LaCUNs8u7v+nXaAER3Sv5j3f7dMH3brYHytneLaWlRAF6du0oan
	x0WNv/ooSPcq/SvuxpRqZXmOkEVarr2UNTFOPi4xLdds4+SktrCHCGMGjtWU9Q8xwyjWm+rTZFT
	6AIq3dGaulFgg8dL863Akpz0Y
X-Received: by 2002:a05:622a:a993:10b0:51c:845b:ac4 with SMTP id d75a77b69052e-5213d7b01a2mr74484641cf.3.1784538802202;
        Mon, 20 Jul 2026 02:13:22 -0700 (PDT)
X-Received: by 2002:a05:622a:a993:10b0:51c:845b:ac4 with SMTP id d75a77b69052e-5213d7b01a2mr74484401cf.3.1784538801789;
        Mon, 20 Jul 2026 02:13:21 -0700 (PDT)
Received: from [192.168.120.193] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c1705a09a44sm430117066b.19.2026.07.20.02.13.18
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 20 Jul 2026 02:13:20 -0700 (PDT)
Message-ID: <3e7ecbf7-20ca-4871-ac66-bf52f3a5012a@oss.qualcomm.com>
Date: Mon, 20 Jul 2026 11:13:17 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 04/16] clk: qcom: dispcc-qcm2290: Enable runtime PM
 support
To: Imran Shaik <imran.shaik@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
 <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Brian Masney <bmasney@redhat.com>, Dmitry Baryshkov <lumag@kernel.org>
Cc: Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260718-shikra-dispcc-gpucc-v6-0-62703e05ef0f@oss.qualcomm.com>
 <20260718-shikra-dispcc-gpucc-v6-4-62703e05ef0f@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260718-shikra-dispcc-gpucc-v6-4-62703e05ef0f@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzIwMDEwMiBTYWx0ZWRfX7ACBejEmE0tS
 TRAejIxgX2dLVFQII13VLR26ku6vUanUxwEI+Rr71LrtD0lKk9VTDX/8ppaeTLNv2R7mL6ib5W+
 rgULqF2gPIbSUzdN3rnhuEbgktpVhOo=
X-Proofpoint-GUID: FxuL_C-siHkQwwZnCJ30deYiFWLI6eAg
X-Proofpoint-ORIG-GUID: FxuL_C-siHkQwwZnCJ30deYiFWLI6eAg
X-Authority-Analysis: v=2.4 cv=a+sAM0SF c=1 sm=1 tr=0 ts=6a5de6b2 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=EUspDBNiAAAA:8 a=jzfokHZFP97BDSaoeOQA:9 a=QEXdDO2ut3YA:10
 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzIwMDEwMiBTYWx0ZWRfX4J2dyNBcIftV
 Npmc1Ud4cBE+yRARwd2ttvsQOmsWgvrf353yzXvWVam15n9RlxmSN1UkZNIC5qsrluAcide/ZBM
 4NKNqhct55sdy0UmXb1RIBOPJM6WD8bHSiRaFyi+TKCLm8lXOSvP9KM6AWN7J+GGTvHzR4gjyPH
 mh/yHuUN4WkhWr9jjFoQgi4APdErVMEusAiqTga7koXN1+dUkUGfAENJSPtVjogX/plcABqqyPE
 LH+MjMimSfWMI4wWF7vPhPTSPH+QMTzjMVQPAQ1doZyU+Ns5zzEKVJebMh1x9F1pmigiFsMMmSD
 8CstS32FGtYxGKJvy4HxwUEYGmNha2y47s0ET7jsgVsjdfjyFsyszhOpr6mAQ9gD+ViR3mCfs7J
 CcqRoI7WsBPUvO8PafyLHMxc/qu9+Rn+vv5upgd+tnCiA5+3fj51tdmREqrxs7AhlXU+MYK3y8p
 sDoJT6Dtyumdr1Ouzaw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-20_01,2026-07-17_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 clxscore=1015 impostorscore=0 malwarescore=0 spamscore=0
 phishscore=0 priorityscore=1501 lowpriorityscore=0 adultscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607200102

On 7/18/26 2:56 PM, Imran Shaik wrote:
> The QCM2290 DISPCC is now associated with a power domain (RPMPD_CX) to
> propagate genpd performance state votes to the CX rail. Set use_rpm to
> true so that a runtime PM reference is acquired and released around probe,
> instead of leaving a permanent 'enable' vote on the power domain.
> 
> Fixes: cc517ea3333f ("clk: qcom: Add display clock controller driver for QCM2290")
> Signed-off-by: Imran Shaik <imran.shaik@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
