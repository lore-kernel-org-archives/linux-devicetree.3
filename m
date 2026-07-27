Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3FEB141B8D7
	for <devicetree@vger.kernel.org>; Mon, 27 Jul 2026 13:59:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785160748; cv=none; b=L0au3C0iDa/mNKLMz9ePSDlJ5VbRqm6RoiWgH7u7D3TxbTS6QrASSA6XoYBSqZ/w9OQ3TeDMKuGyatzCwWXpAu48N26hbG31pDeGAvhxUS2s2aouf1DsCXEpAOD3EGggkRNBj84+JaMde7BmgnYOtUjGpEKXRiRxWBiUlUy1Mo4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785160748; c=relaxed/simple;
	bh=axRm5cQMQQfzCdwEagsVytROKWgdXuljM0oFEgdZdXo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=kLJbP40eb+sNKAgWX/l23Er4NInrIdiDMAUDi9xr2FWRG8CVR9pBEyUfWZUBraGHAkwufeNEf7+I04Xllrvq1BjrPN01vDrz6Ox7L7JF+aiWoM861xuHdR+5liGMhBK9mkxsmVPKTSQGCb6B9EpPtrJZLLNDpIZD3hRxv0N4/hQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=kwRv7nEW; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=i86XdT67; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="kwRv7nEW";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="i86XdT67"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66RDlvh73787534
	for <devicetree@vger.kernel.org>; Mon, 27 Jul 2026 13:59:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=K9q69KkJjPhRe489NbyLzvP1
	/X/Dng1mKDhtBr7gXxI=; b=kwRv7nEWIfFJQnbr+qq+cSkWOJk8EnIB0ot65p5n
	1PoN6Yce8d1A8hv5fIPk4qiVAqcA822TqzWi1FDS8mldkRZhwJHMWxlHMdLGnZPU
	YXn8td4QlFx9NxtMaKkCsr1pbVntH67CkBWOQa47i/Rr+3zAYRTD9gl7FAMb//5b
	hdLOQRb/0GNTpnYGL8Y3+XOujmRNLoUBK0jprBNfo4n9zOZLPOH+VcHXApULDSvr
	Lt1oeVc8sxXmuw25OTiVeUfw5p5/1QElT/ge0IMwpz8uY/foTxnwa57KZ+k1pXNC
	qDVLnDRBEqWE+cYfh/OIh05Ar4ruvbZtjvSjN/2XT4H+fw==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fp3v2h7xq-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 27 Jul 2026 13:59:01 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-51c1e6f602cso48571761cf.3
        for <devicetree@vger.kernel.org>; Mon, 27 Jul 2026 06:59:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785160740; x=1785765540; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=K9q69KkJjPhRe489NbyLzvP1/X/Dng1mKDhtBr7gXxI=;
        b=i86XdT67rTJX4wx2WTRPqrI1Y/3sl43w5WaJg5Qep2nlWx28LiSJZJFVmNu89XmgnG
         veaSlafmJSK6nLyC46PPgruHLyNTo5JueP3HC1klKrp07Za2FKTa1FSu449He9s+6YRh
         b4HnqBwdKZt3Odzf1BuoZWlNx8eDVj58Ai/I86+HPYeRpxVfAwlaQ0OBoo2CZnBIihhl
         OUliV369Y1ihK10tB/n1QPqc/nc1Ii+fdl5eVYNC1blbbz9QuXqGN0paEcjGwHQkf5+x
         dJvhZ6BwIzNqQA8U4bRS7t/9wor7PUY1urfjKZOeo9f2hrhs3vo5U2a7MlmIRZAtlMRD
         H7Rg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785160740; x=1785765540;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=K9q69KkJjPhRe489NbyLzvP1/X/Dng1mKDhtBr7gXxI=;
        b=rdLxTq4yrOsvLeHl4LE7Zeb7KwSaiSr/euQPMWF7WVuOfI35LBPIvVrd2xUbE1fv+x
         EZj8/C9jxpjsJe+3NmM7XdSuF28HPPYYIqglcamyh1vARREh8HpvEifD6Lq6fCPm2XtG
         IQs6wnrP1OsdbJvhM45GgTPpsC8g/RzgCfwUoN1mUZicIYVStWCEJX9tMBVzw5GK9vLf
         GZoavtff8QoY3p3DFHFOOJK0RONHKywfcCn2SgzoLPaWZb16DatZSoKdY3BwcJjP3tej
         nviSBQODsdOP5dsL6V4L2KDFaKH/6GaFFvJB7tUhXByRznzpRiSH2Y6/cMrm+lTOJ82G
         N4aQ==
X-Forwarded-Encrypted: i=1; AHgh+RrYscQfgmN1/vhUey/YjAZxvVx7Li9y34tQEVAjG5/6F+c+1UQXO8t5WR9aVwCfnOeYC+8Ud8xrlBgT@vger.kernel.org
X-Gm-Message-State: AOJu0YzoM4ntW2wK/31y9jVlHG8OPjJTfZMBvBny2By6ES56G0sD77s7
	OBX6v1KGBUBXlIFIh8YO6NxphhG8qB89NX5aGBRAVnuxBhx3EHDGzLxumzBKgyN6nXiKPIy+jWp
	wkqjyV+p2LupjUn289/KNJ1DfPKba68KMI+CEVy2AZOARuL6PJaexQe0TwSfA2nqz
X-Gm-Gg: AR+sD11EId8A6/fDBQQSRrcsH76v5zp/KHtytZa1azPuNzuhjuqCjjuyV8BJvJcDWzc
	GbA3vv/3xp5GPbXTxrA636rtVbtqcWbfCO6jtMXyvAisBHbFuVz5/HNjMjQm5WOgwb+pJnsW9Yf
	7ihl+IyYECQJJoRtF3sMFaL2QZvCh2uryqwU/xmH3GQ7JJe+RjQLx+6qcuGxccfw7cB9UwJHCKO
	Rv3a7Godqg+seaSmXzFp1VLUd5a2bADbKSVqTTsP04ZckQoVLrT9cYg26YR9nIc7KcR03NfLKsn
	tdM96TpGdnYg2LMHDu1MJhq5LqhiX39+Y2GzZVGcGhc0MPVMcaEVprX/ioC8A3XhfqWX6NwBf98
	yhVk/IujPAdIYGwE=
X-Received: by 2002:a05:622a:1aaa:b0:51c:147d:9bec with SMTP id d75a77b69052e-529a833d0d0mr88179761cf.6.1785160740271;
        Mon, 27 Jul 2026 06:59:00 -0700 (PDT)
X-Received: by 2002:a05:622a:1aaa:b0:51c:147d:9bec with SMTP id d75a77b69052e-529a833d0d0mr88179361cf.6.1785160739786;
        Mon, 27 Jul 2026 06:58:59 -0700 (PDT)
Received: from oss.qualcomm.com ([86.121.163.114])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-496b4f302f8sm217639325e9.12.2026.07.27.06.58.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Jul 2026 06:58:58 -0700 (PDT)
Date: Mon, 27 Jul 2026 16:58:57 +0300
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Gopikrishna Garmidi <gopikrishna.garmidi@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Sibi Sankar <sibi.sankar@oss.qualcomm.com>,
        Pankaj Patil <pankaj.patil@oss.qualcomm.com>,
        Rajendra Nayak <rajendra.nayak@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Subject: Re: [PATCH v3 3/5] arm64: dts: qcom: Add Kalambo CRD
Message-ID: <vxxyjhnsmtfxjaldiytzvxgexebsl4jjwy4ofoj7eeqqljhrep@ybcdvwdj3yip>
References: <20260727-b4-kalambo-crd-v3-0-25280faceece@oss.qualcomm.com>
 <20260727-b4-kalambo-crd-v3-3-25280faceece@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260727-b4-kalambo-crd-v3-3-25280faceece@oss.qualcomm.com>
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzI3MDEzMyBTYWx0ZWRfX153TvUMkCXXg
 BGNko0EJ9UfvlwmBiLjXstOETmlDlS+/YjeOckMq6h10XnRdzUR+QSs8E3UNBbuydwURVg2Q/Vr
 EBxuSWz45Oux5VIRPs42mG521rZCmhc=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzI3MDEzMyBTYWx0ZWRfX2H85E0qbcO1G
 6lhECULCDelkQO8u1ZDXx21bNhlWqLtXWsGiTOmpUGLDr+5/k4ewSSLl22bJVJ2C0dWHMTnLFDn
 NqzfktuHtXqCyp+9U7f/fgcPjb0qKn95HESNf2lNjYDmjrjTq6yJyB45y50zYioVvdfzdOzYiIZ
 +uIy1pCSRiiEHaXxZD0B83oMbK5TaagYJNFEAoBZjUIg/3qON0z7y6MJGk0iEcZZBvjFcVi7xWg
 U0Ys+0QUar4x+wQkwzf1z8AUBnDeusZ3cZezCprnqpxKE25qbM5w5p5Vu2JtKDBLujEWKanYXCy
 AK0/PP30iinFd2An+v1yUez2Cr/5g9GKh1SsmBpfoUbsrWsAaFJFBFz6cweffUqC9mehgYfUFc5
 4umJ2ROyZxa/b0PtRor9bddSR9Xi3sA2IuXLZogI4rW84tliOKCCLs/7wqhcpYca5K9pTrCT/ts
 1h2UG6VxhZpdAfuUhAA==
X-Proofpoint-GUID: YOHyzmECY4T_ZWZzSmBCq1nhlb7GCJLK
X-Authority-Analysis: v=2.4 cv=KJ9qylFo c=1 sm=1 tr=0 ts=6a676425 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=6dw9+iwJWV8PcCi9M4lOBg==:17
 a=kj9zAlcOel0A:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=EUspDBNiAAAA:8 a=Hkh_rGh67Udisc0sesIA:9 a=CjuIK1q_8ugA:10
 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-ORIG-GUID: YOHyzmECY4T_ZWZzSmBCq1nhlb7GCJLK
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-27_04,2026-07-24_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 impostorscore=0 malwarescore=0 clxscore=1015 lowpriorityscore=0
 phishscore=0 priorityscore=1501 suspectscore=0 bulkscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607270133

On 26-07-27 05:51:40, Gopikrishna Garmidi wrote:
> Introduce support for the CRD based on the Qualcomm Kalambo SoC. Similar
> to Mahua, it is pin-to-pin compatible with the Glymur CRD. It reuses the
> common CRD board description and drops the PMIC nodes not present on this
> design.
> 
> Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> Signed-off-by: Gopikrishna Garmidi <gopikrishna.garmidi@oss.qualcomm.com>

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
