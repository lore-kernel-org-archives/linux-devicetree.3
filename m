Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 11EEA30BF68
	for <devicetree@vger.kernel.org>; Tue, 26 May 2026 06:42:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779777723; cv=none; b=t9K3pjIEtmidr+SUhwFIHceihkiwMSejiJKkgGeEO+JEFSjoybtM+szsr3SXfOpVf7P/4f8vyhe/Ygn95JpHZYveIWBbhkO9+YAObgEa48RzILpNgVqGGrcGGFfW6HWMYHNkZHyAPdUtsb6uY8ve9gMyjxSRGfmu17kRbSOIhBw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779777723; c=relaxed/simple;
	bh=wYYvPGKKIfxvxOfDfzhnoD6V6y+gxUFtI1B+tZxdn3Y=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=HkdGdVfc6YSWazYYkKY4YPOB1GGXBgCYIJD3kHn9/jJnu0IE1YwSNW+CnNNmPyTETwzjX+BRzI7mbYyOerqQ1RsWZN/StSNkaMIgeM9VtXkQitF7nCQSHRYSOBsALOPCCI+7NXCI4OU8P5+7gtKKc/efXOB4YzAa2dnR48Y40a0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=o+fmvfOV; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=dRwATpAu; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="o+fmvfOV";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="dRwATpAu"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64Q5sAnJ1802358
	for <devicetree@vger.kernel.org>; Tue, 26 May 2026 06:42:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	nx7dST+rJAS+31ZmDGbjNSLJU/fJwkaTptXWG8RZ9k8=; b=o+fmvfOVsG24K0Ab
	hTzqZYO8ng4P6kSWsC5Ge2thjXLa0yQUpOc74ZnUER3rvoC4Jw30NRpy+qv6iBWt
	eQSJ+3EMZi7I7gabCCEqO1SnekFze9Z1gxaqMXv3mPRwBJtQOtm2Y+Knwn0YRo0F
	GKKzayvcnJRZ7cTrPUV8q0V7DdLmn1WXjcompefnjkk6Bn0Bq5nPLH1mx1Cizfpz
	wfR/Kx5v3AbB3vbyetJasRr1Z3hp6yEPPWR+aCeVgououlvkY7NzQv7yIF0VPXGs
	pHDsPGGtjSVIEbSGSnBtBngPCGrFbsU/ezuJGfOYgouumbw6pGL+QigtgIMl+MRy
	b0vivw==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4eckyqkb98-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 26 May 2026 06:42:00 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-367fd7b8825so10192223a91.0
        for <devicetree@vger.kernel.org>; Mon, 25 May 2026 23:42:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779777720; x=1780382520; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=nx7dST+rJAS+31ZmDGbjNSLJU/fJwkaTptXWG8RZ9k8=;
        b=dRwATpAuZMoXxNx8ehPumjmVWOOW9C/LC6P9UwL/L1ntKuzV0c1+ukTN6rHAMo6Grx
         KnlXiIUYTc/Lbzwk7GF3vwhmCDwDyjEEGRslqK+7QEwEI5GZh7qQGA00yUIIyjQrFgKj
         A7XPoSrdynWfB5nT4gDjONTFmA1wqg8E0U4ackL+1D/OIE63UkJnxGWBWC5/2bqFeJxJ
         Bcsgvq8p80suHGvdy9yk3CNGGacuXGz56TxbXodHNCJNRqFIzko8qYPkwJWcfFsUkMv5
         ZRy8hG2esPBfSwFefQITLBjx78692s+Q80MtseEmri7+BMuu6roFc9u3vft/7xVyORnV
         0wSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779777720; x=1780382520;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=nx7dST+rJAS+31ZmDGbjNSLJU/fJwkaTptXWG8RZ9k8=;
        b=MydvCe62Jn034CLet6ojUXobox9LyF8W1gbud5UPDU+blkjTKwSPc29d8yAWl3Yajo
         eApUB4maZDBY+ogAyYsDhVDiwt4HC+WqZfjP+/yMPljENghoMArRdUYq1LnyXxmpoXkp
         PcvGU12WImapNrsefAP2YZMUFOcqERFoEyiYIq8J/51l9NLuEZ0cyEZYPdVBPXlbGNJ2
         C7b/2P0wyEX0pF6UxsuoCQXNtXcp1g1u76kt3Z0BInyaZrWlfGehajKHylP08GfUNpUb
         8ZOV6LDqBDILg5Tk7IWb9MNEpnFHOvZTbP9f56wjP9p30YhRw43g/W4KhbMerik+Py9c
         0/RQ==
X-Forwarded-Encrypted: i=1; AFNElJ9YhWfQWB8x6O9apRVo+PJVwjqSdu/CLtc9viWqQGB+gQQnErMsL9y0F+WwYYKtgMjgJbtYNaT5G07w@vger.kernel.org
X-Gm-Message-State: AOJu0YzFGIZ4+P0W8BohJr7GCRnAk0zxokT3wBDPNr8jpicxCrsqdJYU
	Rdew+tTxsLeoLFEayqQjV2HNhysWMZcm92ZNBXuLJR8DgDrwx0cJr0K74BqebvqcRmUpAgJHWrg
	13uvw8M8rG859KXIBnd5mnRldfJDmGKLl12ypHUBFwtuJdqAoyT09U3CWG6pF62v6
X-Gm-Gg: Acq92OHUbABS+H2Tps9yqtvw+bQkowSXVy41L/63k/yifMIlXEn2YtyAwsb2OunBoDi
	pAqPidf1ug/2r3NiWqRo4GklGQ3ZJUVSrTem33ulLhU4UD0+ac5PeOZkAemprAKPewPa5rraubW
	CvBBffCBEs5xxEiZy4lWEOrrKMBG6OmJXW3DWGoFoJCLuekGEEDiSRffwFlC7UkcfRsmYAgqGkX
	+n/gNPmNh6yY0RzOfQPM9xYAkF2BjyveH9OTBfzdgiwRGQPgHNYPIdrf8n/eM97x1kai0rQm6BX
	MhPkiyRT5I6SSUUrid1darahC1A88/eCWPLelFFKoZBfkEQCuWdUPK6QReJzp+jltcLiWqSNxG/
	zeVnlHnTaXO4I5lSGIGlFlv7wm2lTuv6UvkCnbsgzKJ6I4lc4gw==
X-Received: by 2002:a17:90b:56ce:b0:36a:cace:a4b6 with SMTP id 98e67ed59e1d1-36acacea4d5mr8607077a91.9.1779777719856;
        Mon, 25 May 2026 23:41:59 -0700 (PDT)
X-Received: by 2002:a17:90b:56ce:b0:36a:cace:a4b6 with SMTP id 98e67ed59e1d1-36acacea4d5mr8607044a91.9.1779777719373;
        Mon, 25 May 2026 23:41:59 -0700 (PDT)
Received: from [10.92.181.2] ([202.46.23.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-36b0d6a612dsm810455a91.17.2026.05.25.23.41.54
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 25 May 2026 23:41:58 -0700 (PDT)
Message-ID: <190e16f9-f467-4446-a5ee-eaf01ad55861@oss.qualcomm.com>
Date: Tue, 26 May 2026 12:11:52 +0530
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH V2 3/3] phy: qcom-qmp-ufs: Add UFS PHY support on Hawi
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: vkoul@kernel.org, neil.armstrong@linaro.org, robh@kernel.org,
        krzk+dt@kernel.org, conor+dt@kernel.org, mani@kernel.org,
        alim.akhtar@samsung.com, bvanassche@acm.org, andersson@kernel.org,
        abel.vesa@oss.qualcomm.com, luca.weiss@fairphone.com,
        linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-scsi@vger.kernel.org
References: <20260522172716.820490-1-palash.kambar@oss.qualcomm.com>
 <20260522172716.820490-4-palash.kambar@oss.qualcomm.com>
 <szzkygcwnrx2p54hbulzd3edhwzueaulhpyl35b762yo4enepu@zgzv6oxdocha>
Content-Language: en-US
From: Palash Kambar <palash.kambar@oss.qualcomm.com>
In-Reply-To: <szzkygcwnrx2p54hbulzd3edhwzueaulhpyl35b762yo4enepu@zgzv6oxdocha>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=RMyD2Yi+ c=1 sm=1 tr=0 ts=6a1540b8 cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=j4ogTh8yFefVWWEFDRgCtg==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=EUspDBNiAAAA:8 a=ZrBsj_3XA7F7z1mTZmAA:9 a=QEXdDO2ut3YA:10
 a=uKXjsCUrEbL0IQVhDsJ9:22
X-Proofpoint-ORIG-GUID: zrTeRSNCAfq_8odR04DFh5rfGK_Kgz1G
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTI2MDA1NiBTYWx0ZWRfX9cYy+U2ZN6AE
 8Q2kqPK75j1RkJynTFYCACTnHzPFc0+c0SD5P2rB5N9l1F2vznVOQ5Ft25jq4iOMp9wcGt2Q9E5
 sAhow1xbXF0Cdn15OcCTQqs+qcTjLzOx+WIIlGZy2wYGH/nAEP608zLKLUp4WhoV7rtsY96Xff/
 YNpMdZqEFIL0pQ14mf8hyRPtEmTX7+6mKkxSCy1s4zC99rMJak+m3zjKTu8OcLvMVJCdw2VQb5W
 neR5Exp3LNV5inyCnD8zraG66h3/8Ktqei5ddhPM0s2LQTNdbWkyH9QPJi/sUSocTubZMANwQm9
 Cf//pKDi33JOFBK7iE3TWwGwGC1td4pYi7skVXNm/e/UBILldWmUvHtc3QKijaCcFCKAwK1CKsb
 zewZqg7X4XZhJAdWYz2gOLxwTI8IyO4GAu2jPveIufPu5qV0n24LHvnZTLNxq6xo1dlwERoFBpb
 mAKDm5ksxtWRD4uK4QQ==
X-Proofpoint-GUID: zrTeRSNCAfq_8odR04DFh5rfGK_Kgz1G
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-26_01,2026-05-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 priorityscore=1501 malwarescore=0 suspectscore=0 clxscore=1015
 lowpriorityscore=0 phishscore=0 adultscore=0 impostorscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605130000 definitions=main-2605260056



On 5/25/2026 2:15 PM, Dmitry Baryshkov wrote:
> On Fri, May 22, 2026 at 10:57:16PM +0530, palash.kambar@oss.qualcomm.com wrote:
>> From: Palash Kambar <palash.kambar@oss.qualcomm.com>
>>
>> Add the init sequence tables and config for the UFS QMP phy found in
>> the Hawi SoC.
>>
>> Signed-off-by: Palash Kambar <palash.kambar@oss.qualcomm.com>
>> ---
>>  .../phy/qualcomm/phy-qcom-qmp-pcs-ufs-v7.h    |  24 +++
>>  .../phy-qcom-qmp-qserdes-txrx-ufs-v8.h        |  37 +++++
>>  drivers/phy/qualcomm/phy-qcom-qmp-ufs.c       | 140 ++++++++++++++++++
>>  3 files changed, 201 insertions(+)
>>  create mode 100644 drivers/phy/qualcomm/phy-qcom-qmp-pcs-ufs-v7.h
>>  create mode 100644 drivers/phy/qualcomm/phy-qcom-qmp-qserdes-txrx-ufs-v8.h
>>
>> @@ -1306,6 +1315,12 @@ static const struct regulator_bulk_data sm8750_ufsphy_vreg_l[] = {
>>  	{ .supply = "vdda-pll", .init_load_uA = 18300 },
>>  };
>>  
>> +static const struct regulator_bulk_data hawi_ufsphy_vreg_l[] = {
>> +	{ .supply = "vdda-phy", .init_load_uA = 324000 },
>> +	{ .supply = "vdda-pll", .init_load_uA = 27000 },
>> +
> 
> Stray empty line

Will fix and Update. Thanks.> 
>> +};
>> +
>>  static const struct qmp_ufs_offsets qmp_ufs_offsets = {
>>  	.serdes		= 0,
>>  	.pcs		= 0xc00,
> 

