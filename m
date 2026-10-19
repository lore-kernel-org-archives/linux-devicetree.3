Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 81713489867
	for <devicetree@vger.kernel.org>; Mon, 19 Oct 2026 07:25:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792394750; cv=none; b=skCMtC2i760oNN3PGmUa6zNFJ/Dds6m2S6y8C7ZWsfBfKPSADOb4kbdlAbA5v5zxNCPepnem1E7L6I0zo1NTJX8dpzISiVro2LVZMBdu/kTgN1bFeqeb4uinI6eo2d8Sh0iuNO9fAkgfVWSSMPgH24Yee3BqSfYeW1u79LcEIzY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792394750; c=relaxed/simple;
	bh=0xQUeD5kuMCGhhK+FQyGwuZHoSMJnIxmG3EWT2YgZuY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=grRE2q2iDgkuZbcznAMxm/L7qJNfqjfEnayrQhwyf24+GbtT4woXChcHbE2kF2Mt+bR8BtH6K4/sP+1CVWRZw1Xe+f19oK6rrDx7Zccjkq/CgtrxVggxj4N/SO19DMRATze4gUT/5LRKYFtDcV4zHVDI80cwoPAr3cAQTZpOMLQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=TNYbOH2T; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=G01N6IaP; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="TNYbOH2T";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="G01N6IaP"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69J4jplD2180151
	for <devicetree@vger.kernel.org>; Mon, 19 Oct 2026 07:25:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	MfEQlfKriOoZNiF29x59T585s1PSoDwBql762uznc+4=; b=TNYbOH2Td/6mbw6T
	2/pcZsReh2I2+54kXl6sXTBtpGyTBa3K63+Tk2botHPQZvWalwe92OP8Zn/IFLig
	oVPkDxOk5BKaozNWbHkBWFjEfG5cvPm1D1oGrUI13sqyPuNeECNG1kOvapi9PXmZ
	wXnF4w1VHjPntkM76V8bJj1TMUwi+f/FEqJPkciYb05oDFFIYQu/bkfwlv09Kmkj
	DcurPDVSjlSU+MCWemYH2IgXUnxIDLpkjSSYwuwAc+WLIrNOC0D9Wgm12GX3uhGc
	ulGDQrBDJZTeO/eGOBcONckSSa238Lnmy7o3GIHFt3p131FDOY0STpWQHpfdU+vg
	Ki2xBw==
Received: from mail-dl1-f70.google.com (mail-dl1-f70.google.com [74.125.82.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hd5u1hhnv-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 19 Oct 2026 07:25:47 +0000 (GMT)
Received: by mail-dl1-f70.google.com with SMTP id a92af1059eb24-16bc6f3fdb1so774835c88.0
        for <devicetree@vger.kernel.org>; Mon, 19 Oct 2026 00:25:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792394746; x=1792999546; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=MfEQlfKriOoZNiF29x59T585s1PSoDwBql762uznc+4=;
        b=G01N6IaPLOBmrrgOTHpMoSCJAHk7Oib3ukKS8s0uFVdY4HqytPL8JjZ6FeUSjmNdRe
         2l0RrKzjb6JjXUCk0dCWCzi0jYXcUSehEcZ7UDyJrLr8bPeC6tZXwgkwX4FBFkvrN2x+
         ZnLSeyHYIF7EpMEJBc0k1gD6WL8Gypvd3nv3s4lidUV3jocDT1DeK+MAgAvTvNOisl4i
         fYYxYjfK3u9wUsFyadZmFHylAuld8yYQ34z+dr3jXNJNNbfNkbmL46UtpjoR5AdqBc2/
         6J5f0upi+lXB2uctl8K7R46Hj78KWB/b6djzsvWiHOn/K9PQetq7xPLHp0+QDfncMGCB
         1mqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792394746; x=1792999546;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=MfEQlfKriOoZNiF29x59T585s1PSoDwBql762uznc+4=;
        b=uzUBHgDuyON85V6UoAtZLl5aPELEyHMyTLUiHsKFweI/4+mAxQf5bPs32iTok63VTW
         lEFZQq/GA+NOzcSJwav/2tIOkBYCY2sHMB7WMzWEtNhnkESGc0t0ueGaOM+ds4DJAO7N
         WrPG3ZVAqs8Byyk4KaFPBuikauwHLnoSLxNA7zO3KFxym6tx5yZsVgj18ccws8GCM3NI
         bHCuMLZgn9aq4Rwk5oberXn6Nu9ckxZ3G2IR+hDuiB6XPqjPVjgapsOjAbNDUIpUOHKd
         nw+tfF88WBeJYiakZrDrohaY37ODbuLh+ISJ/71I8buzW4yVu0IwNIblG3NHeTGUqiLN
         8+VA==
X-Forwarded-Encrypted: i=1; AKwUvBwMr55yw/2P/X7C8V1mX0YuxGuZpciF4PX1U2C0rLdNJ/jKQQxSEgYlFOgKtptvKfEDVum0mIb/ojap@vger.kernel.org
X-Gm-Message-State: AFq9FYIbfjWEq7W/0VHcLDSttpGsQPkhaiVwQdKOgicgZ9gtZnPwMUHl
	BRDzcvC+iRtojRszOBMyiguPfCrYFKGDjf2t4gQdDUsrF7qFCDDS/qDG6xkh8waby2bNnbjejy/
	6TDQWPIKlR2yjqZzezru0aYiP9lcLiYn0DFaPL14mz0WI1d+MOO3wpbIk00cKnS+7
X-Gm-Gg: AYBFou2S46dXZV22hAe8YFdF3g/sYlUShlvek9pua4V9ySAG7Z4mDnx/kploxOHDWic
	JdY3FB4byslViw95AZuE//OrJJOruR5dpYGY+22SF9vEk52xtltqR42qJwPhTzW/5sUB0Tt5Y2M
	HH6iLRIT8mhN7Dy5oMKV+hY5B6vNcmW2eERaegswBtTycJWcEZW927Y1R5EEnBE7xBEo8skcw08
	9ubzgqHqwFaPhG67KYmSYX1jPOm5q7FiMGu5awjjBmmsNCk2SWfgX6Ava20N5rEIDkEimde5eUZ
	U+JHDdnzsaxqvouW6lacXY5ZzEA7ioSkCQ6x9lZ4A5KWXT5YacJMM5oyQZGHb6B6xGBnLWLRuPk
	37Bmv689vKhRkPcXjhf+dZ2RG3Qdz0w==
X-Received: by 2002:a05:701b:4309:b0:168:3243:c91a with SMTP id a92af1059eb24-18511eb6891mr11403398c88.13.1792394746217;
        Mon, 19 Oct 2026 00:25:46 -0700 (PDT)
X-Received: by 2002:a05:701b:4309:b0:168:3243:c91a with SMTP id a92af1059eb24-18511eb6891mr11403360c88.13.1792394745648;
        Mon, 19 Oct 2026 00:25:45 -0700 (PDT)
Received: from [192.168.1.10] ([103.211.19.100])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1831919fdfesm26416418c88.7.2026.10.19.00.25.38
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 19 Oct 2026 00:25:45 -0700 (PDT)
Message-ID: <7766382e-5187-465b-aa89-ff1bf9a16588@oss.qualcomm.com>
Date: Mon, 19 Oct 2026 12:55:37 +0530
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/7] dt-bindings: phy: qcom: Add qcom,sa8775p-csi2-phy
 schema
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Anusha Arun Nandi <anusha.nandi@oss.qualcomm.com>, bod@kernel.org,
        vkoul@kernel.org, kishon@kernel.org, robh@kernel.org,
        krzk+dt@kernel.org, conor+dt@kernel.org, neil.armstrong@linaro.org,
        mani@kernel.org, gjorgji.rosikopulos@oss.qualcomm.com,
        hariram.purushothaman@oss.qualcomm.com, akapatra@quicinc.com,
        jigarkumar.zala@oss.qualcomm.com, loic.poulain@oss.qualcomm.com,
        vladimir.zapolskiy@linaro.org, linux-arm-msm@vger.kernel.org,
        linux-phy@lists.infradead.org, linux-media@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Vikram Sharma <vikram.sharma@oss.qualcomm.com>
References: <20261016235502.2274268-1-anusha.nandi@oss.qualcomm.com>
 <20261016235502.2274268-3-anusha.nandi@oss.qualcomm.com>
 <851434b3-4cf1-4371-9b4a-57dba8022e13@oss.qualcomm.com>
 <20261019-funky-real-skunk-eda6dc@quoll>
Content-Language: en-US
From: Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>
In-Reply-To: <20261019-funky-real-skunk-eda6dc@quoll>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: ys72gJ1PcRQhxePrrg_6Qobf6xqlCOHF
X-Authority-Analysis: v=2.4 cv=NItAaE6g c=1 sm=1 tr=0 ts=6ad5c5fb cx=c_pps
 a=SvEPeNj+VMjHSW//kvnxuw==:117 a=ocEEpg4cTnoGtXECQz/e5g==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=K1xP-2VuxSs3Jipg4doA:9 a=QEXdDO2ut3YA:10 a=Kq8ClHjjuc5pcCNDwlU0:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE5MDAyOSBTYWx0ZWRfX911GvmJAHpej
 K/h83dcnB62i9EYwKVx2pwHQVxqXS/0K7XonDg4iOAUhGf0ZLcGzDR6rf7STROTLg8w9egGdoYw
 CcwJjk86qk7ERooCkKm8LASZZLVHyBc=
X-Proofpoint-GUID: ys72gJ1PcRQhxePrrg_6Qobf6xqlCOHF
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE5MDAyOSBTYWx0ZWRfX7S7USrw+XZVc
 Jd/VFDed18dcF42GtI5uR9atkWLric0aEXaXJtTZaUKLQWOdnKhsgjBBFGWCoguW73a+uUB6/uI
 yNd25WyQGdc7FnsbH+Iciv/6t9jZBJsJjJFKBwE71Vwcwr2KM2KlaLQaRE+wYNRH1443KUXid1V
 910VPvcFOIDtFA60vhRUifu9rgvmbfFo5r0yNWFq12Q34mzEn+zuImQvwr9PneLGM/8jczAjVW2
 KTnhPQygDoeuh2aSyuTFJzdffhGNhhcnxiV7Rmt8lVkt8uOyhXx66gy4J/G8uHc2v7MOt+I2hpZ
 sHrkoJyev59kykc4pJBAeLsl4HQdZ7MQrkU3TsGabTm90cbOGLwmrt5zPh7RTWOuM8QCJz5kThp
 G70HKEky02A/vTNngGD/W3Si2e6jWTumKmmdQ7lAWieS4wDhWUUM2a2I25dhSegbZDfA/7TQUGg
 3lomlhrdmH/BxlYfJZw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-19_02,2026-10-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 phishscore=0 bulkscore=0 malwarescore=0 impostorscore=0
 spamscore=0 lowpriorityscore=0 adultscore=0 clxscore=1015 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610190029



On 19-10-2026 12:43, Krzysztof Kozlowski wrote:
>> DTS uses 2-cell reg but binding example uses 1-cell. Please align:
>>   reg = <0x0 0x0ac9c000 0x0 0x2000>;
> I don't understand what is supposed to be aligned here. The code is
> correct.
Right, the DTS change is correct.

My comment was about the binding example using a different address/size cell
layout from the real DTS. 

Krzysztof, should the binding example mirror the SoC bus address/size cell
layout here, or is the standalone 2-cell example fine as long as it passes
dt_binding_check?

-- 
Regards,
Nihal Kumar Gupta

