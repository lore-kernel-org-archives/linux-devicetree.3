Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 286B6369D40
	for <devicetree@vger.kernel.org>; Fri,  3 Jul 2026 07:42:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783064556; cv=none; b=vFD4vGAV/+yqXALW8T1YPyzhnX6j2RZjnTFL5vNHzdwhF+Alb/A+bUqsd/YXusdjWdaepoAU+k14DHfVLaP8/oHHrXQrqVYiKhY6vgKPPEY2tUoHKjdZUOqRfnr3X3KQx7lwA140/hD/SZGioIlOEZryaOpeYvhk39s/XG/JTTo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783064556; c=relaxed/simple;
	bh=BzjWFRb3b9wkGzZJrhXMK19l+atse9KtontvxIdAvdQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=uxoN5pGU7+9jkvmcCFeX5DlDn686yVrTjr6QHKfEtvgGSu+sFVdihfxSYl32wQZ/7sTr3SS0zd3o4+VjZsHR+E/M4MAs0Ehl3oyTMfVUriqsiqyVyjWqzxI4ZLhT1MXXO7+CV3MWqz9eYpkiBhA6mQbnTFi4aewSEF3EjtjgNTI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=EFH3Dbcv; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Ba+D2z10; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="EFH3Dbcv";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Ba+D2z10"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6635rvJX3126357
	for <devicetree@vger.kernel.org>; Fri, 3 Jul 2026 07:42:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	vvm3bjpeCiWNxgAV/GYzQ1trc2JZpsOD+BVEOTOo7A8=; b=EFH3DbcvmeLsz2rQ
	qNyoRYSVImtQszdoukdpJcm80NL7eWBIR2UeL4A1fr26BHKXvQBfndZOM8Nr+vX+
	/y/dva1+SkSE1PA9fTDgVV/MTVbJH4PAwv/d7sh5zVmQtATSjBRODeIQarrzCpUp
	Fy3oCExCNRvxFX0GHHlb2YeL7QkQul7CbfAM8MvVhuK87q5VbyXlysyo1pvlxvqA
	9VqXH+gnn4abck+qYYRl6QZhs87+mQMY34xz1glyLhUcoceFPfWOXbT1O1wvBrxY
	cfY7VWsVhP+VZgUxRn6owp6NsEsyNd6nn9LD9+mOyuAkoTQ4edx1egpSay4xooZg
	VsDg3g==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f5tpnkcjc-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 03 Jul 2026 07:42:33 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-51c267931ebso1957881cf.2
        for <devicetree@vger.kernel.org>; Fri, 03 Jul 2026 00:42:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783064553; x=1783669353; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=vvm3bjpeCiWNxgAV/GYzQ1trc2JZpsOD+BVEOTOo7A8=;
        b=Ba+D2z109OQh4jexEBRWWVmqFXPwCoR9WqvROPcMcpshHvHgPMWfXxFE1uDCzXJn7Y
         cOz14N3sJIutYRpydXC33ZBqtI1Gc3GM62k8fYg+AdEMA4UawMMSKDd5QRwm9qErizET
         iAJqXipZrJxTBZwiGAeIbXfMK6TvpA/PdGOjkcP5/Nx7wvauRb945+wYJvyuMTkujkN/
         lrAOJLCNLhrDJnvo1nNrs2uiyTD82dedijRfPLno1IPaj8X6s7Aw6Y4ZnJO/T2gN72u+
         CbxPz76vf6ucdL1TbQW5XTGT//88PeWO0Afo86c1uxnUhN2UHbF/7+nK3jhknZ3vuNGg
         PVWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783064553; x=1783669353;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=vvm3bjpeCiWNxgAV/GYzQ1trc2JZpsOD+BVEOTOo7A8=;
        b=Hp1+XcVJgJ7KOdnzrDgzWSlc0TfJTwNiXmFE/WPTz9x7dhaflxYjPNq7vHO/FeuinI
         H+xZ1Xjrx/IKlXAYGGaNUPV++OGBCz7rsGMRweUpFc7URuB6DNoBV5Wo7vhp+ahcIIHH
         29sUr4TEkbarnK6R+WPZwU9hlvmYqM07JiAmdWZwfX1XbxckPLR1IDZXEVD4t8hCzYUb
         NLFb7mf+5uY1yMOVg30/kyjwL7bjF1LKVwvLpcldKAEwpK54gThriI9PXaUWwv+lJ5PC
         cTGCdkSz5N/YBA+AM7AsvHgvYFI/waPO9BMf2jly61M4vF0EUnAETaMlysbJO5DQ1a+U
         vR8g==
X-Forwarded-Encrypted: i=1; AFNElJ+ELs3v/KGpwGNRIzV2NbHaBeLTk/WFXiNB5s+U/96AACiexaMP1+l3lUppekl9EPgqazWxm0prNW5S@vger.kernel.org
X-Gm-Message-State: AOJu0YyDMEuzxMNHwYLKGA6UC54UgfmY8g1K3Z7MNxcW2DWvZKI+3BUK
	RG0KZKc/LHCVjIuL1Te/AYybteohc43cXmjYlNWmeXa4jTXIKeBl0P8LSY2VWb9Qj0DYKdKBhsv
	P5qZ7dsXQ5cMThs77nWAKeNQcg3nSUci2Tzief4VG5qGDQoTYUj+8+oAGhx/rof5B
X-Gm-Gg: AfdE7cnDmYjH3Dgbev4gUIK8GUyQbwsHOIVWXCg0/uaYzWZZBEGbKuUCzeyLdN7Fj9H
	foVJhPfuEMP82HGstpDeVe8WeWoi7tWNXL5LwknwJyCPL2Ws54V8JO9cFmnmqQM6DP7CrWx1u2l
	XJ+SBtu/e+YQf0ac1+L1aNpUTGwsuTrJ8Dza7WD6mKDDVMLImf9r0rYfIN29LLaVog0mx6MdRHB
	Gc2RsDAifc7B5xJy8PxZ5z3QwLUe7sbr/M27guD+eOomVW5sYjkQ8iJdF5yuBEuO8SItjgJx2fC
	RycSy+CNDW49iXC4swXo6l0EmX7Ale1vI8Z48az8j/Ir/1pZLrSv1bMlEtKgcwtifXyoZZBgpcx
	rqYEfbkCjHBxueOKM17N3seSbuI6gLSYKMJk=
X-Received: by 2002:ac8:7e8d:0:b0:50f:a53b:9d5 with SMTP id d75a77b69052e-51c26a3ffeamr90733071cf.2.1783064553442;
        Fri, 03 Jul 2026 00:42:33 -0700 (PDT)
X-Received: by 2002:ac8:7e8d:0:b0:50f:a53b:9d5 with SMTP id d75a77b69052e-51c26a3ffeamr90732821cf.2.1783064553073;
        Fri, 03 Jul 2026 00:42:33 -0700 (PDT)
Received: from [192.168.120.193] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c12b62f38f3sm246032366b.57.2026.07.03.00.42.30
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 03 Jul 2026 00:42:32 -0700 (PDT)
Message-ID: <3788c687-b913-4b33-b105-9e10c2721536@oss.qualcomm.com>
Date: Fri, 3 Jul 2026 09:42:29 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 15/19] clk: qcom: gpucc-qcm2290: Park RCG's clk source
 at XO during disable
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
References: <20260703-shikra-dispcc-gpucc-v5-0-cc13826d4d5a@oss.qualcomm.com>
 <20260703-shikra-dispcc-gpucc-v5-15-cc13826d4d5a@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260703-shikra-dispcc-gpucc-v5-15-cc13826d4d5a@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: B7U0jrD6G_I2nWMlFx-pFVde0eGbUDBf
X-Proofpoint-ORIG-GUID: B7U0jrD6G_I2nWMlFx-pFVde0eGbUDBf
X-Authority-Analysis: v=2.4 cv=UMft2ify c=1 sm=1 tr=0 ts=6a4767ea cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=EUspDBNiAAAA:8 a=aPmvuzYC7OwECpyIFukA:9 a=QEXdDO2ut3YA:10
 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzAzMDA3MSBTYWx0ZWRfXwCsUa12XF+ti
 6b1kcXs2l5Sfn8eZYKJf5h/0sQIlDFPVqCD4851lAuPY6Qsl+8qng1BdB9hZk3vGE6AccFDUNvU
 +fGzsyJY4RRrK+2GN6Kx7MsZj9AUS9Q=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzAzMDA3MSBTYWx0ZWRfX6hSp2XQlKaw7
 AE1go4zdZ4w2qOcpupFz305H2D9PfiquFWBlyPawr0ZDtl+lSHwQ1kks1kIZ5Q3ddNyp2k4qNcU
 6wgtk6ToWdntQMhDjOCRsPCnaPLKhT9FsCt463xx/rHeRj5LURhelt+/9YBHAcgTI1ZuDlG560r
 LflaZ9uQthymTrcSib5FI3sscZ3OVnUPIKBs8yKj5zkS3U+0386g8MLjsqJuZFbybLeips2Wwyi
 9BGNJz3s4O0rHhssnFy5M7LSk3Z3liAbQSSCyUGRcofsuP1iRN7SvwtTCd6aZ5QXtsUlPEvadqs
 zdIrqzYswJnRv8eMXPlJeWq55oIeGDArGmNPeozezaMcEkYcNm2+6MS8L1bMhPr0SNydr78xxPq
 7AsLPwH19/AgEojXDSR6hpLP6zzy/hSVK4GtcQFo7mjhxlYVe1cMS9Q6C7998xm5MFXUSdTZ6Gx
 LbSil0ek0vWUTI/WT1g==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-07-03_02,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 lowpriorityscore=0 suspectscore=0 phishscore=0
 priorityscore=1501 bulkscore=0 impostorscore=0 spamscore=0 adultscore=0
 clxscore=1015 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607030071

On 7/2/26 8:31 PM, Imran Shaik wrote:
> The RCG's clk src has to be parked at XO while disabling as per the
> HW recommendation, hence use clk_rcg2_shared_ops to achieve the same.

"HW team's" > 
> Fixes: 8cab033628b1 ("clk: qcom: Add QCM2290 GPU clock controller driver")
> Signed-off-by: Imran Shaik <imran.shaik@oss.qualcomm.com>
> ---

on a note, also not something downstream does, but hopefully
this is right

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
