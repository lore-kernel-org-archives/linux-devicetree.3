Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9486F3BD659
	for <devicetree@vger.kernel.org>; Tue, 11 Aug 2026 15:54:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786463699; cv=none; b=NhhNAKwUIs3Ca3ljMrkhJ4ImiOqOvdD2ZvQFHPtYk/0a59D6HgX6N47X2gBpf0cEetMRrHSJNt/4ooUY3PwFvEzrlN3iqm2nHrFfBuv5QLKkVSoH/FGSVMClDwpWYzuTauA1luYRrIcH9ac44q/ufeMGXtaeBQ2Cbf7EGGYQdzg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786463699; c=relaxed/simple;
	bh=vf+m5sw/ANemO4K+knJtXSozx+wu+IX4qR7hnuZNagU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=XnqCgrT0bZieaJbyKqBYtYWiX7A721u0CjRUKOsxp136gqqvwsYauJXOKBMLyBaoHuwnK0QKMC50HNMndilIQOaiisyEWZFFmUANg3y7Mx3O46Vy6oNRPbuK3CK+ItmrWBQ9qkBuLigG0HCpCxClYydS0J8ne9IG5F4rmhQVhJM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=NWA15m//; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ictC6cF7; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="NWA15m//";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ictC6cF7"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67BDWXj3010796
	for <devicetree@vger.kernel.org>; Tue, 11 Aug 2026 15:54:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=elZexqokhT78t/wR21U8SVTp
	ZpqnywJTXTccn9S+dUc=; b=NWA15m//FCm2zFi8wN1WbuvtYEB/h4RaFLL668Yn
	9h51SPzlzcWzwuDgNmyI4UrtQtfCUTaZS2wcRow3vACE2CO9ihy+UreGjA/OoRmo
	1JYFeefZs+lr0U+zX8YCeAX6A/VdWty3OH23sdRQi0DCmE/FiC8TlnlZmEPw7fz1
	1AsY/OvfcX1Rbv78XSiIFyEt5KyFtebmJFZjQtsgi+k+pAYJYjdS1UKXrmKbpLFA
	UNPPy93/AFJUz0mNMsZFVJq/SHcF5ZUowIj8FS+WBijQiozCC4Ae0tQ7lBJwyoCy
	ofMy38OfXGAWZPiCxkjC1ZbRaxsIRrNFJIepGiopaxctNA==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g049g0sne-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 11 Aug 2026 15:54:57 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-51c12e43b98so680931cf.1
        for <devicetree@vger.kernel.org>; Tue, 11 Aug 2026 08:54:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1786463697; x=1787068497; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=elZexqokhT78t/wR21U8SVTpZpqnywJTXTccn9S+dUc=;
        b=ictC6cF7PUZzxxZzI07Fir4T0Ij9Ll1VzEBiRZBimy+qQCLbFAIz8co2ZX2RtJyNL+
         x8osbaCOZGWjOkEBXV98eV+qqp55a1ZigzXUGSo+woDxf+P0j9jm1Xh3O4fIOip+NzOV
         FC5AlGSxGJGehWnNTTOR3EDgLy+m/TMUxOIn99pAnLnesWx5iLSvNombYUg2X/BkiyAR
         JuAwjS0YPO4PQkeI7/x3Wjr1Liz4U6SNmiPjr7yJ31JIxpXfk1qiqtaGb9dbjDvXQQrK
         YQ2GMX3kxanw2ggoSipun/8FBUGzz2GiSnw3yE6WzuVeiImP0wIxx752aEWGvopV49rR
         c9Hg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786463697; x=1787068497;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=elZexqokhT78t/wR21U8SVTpZpqnywJTXTccn9S+dUc=;
        b=ZXxjD4YeeqqN/+z5C9UttH+XNz9rWEkPEWlG3jtDWRw+C8FyG51BJ1KvmG1anuwTdw
         NCTWcLUoD+TKxJI51+8JJMKdizGuTcX0dKG1DNpWs15xWzcYti6wAwNhQ2zCy28hHPGP
         vJNfWUZyoV4Y8FV+0mulJp+ZTHANb/D+6k6qFB6nmVHIj+HbsJYpkam8Dt7rzQ0CfUmR
         keycjzcCkKTwfELJZPxMoFhFj9nF3UL7BfVTwX6ZE8clm5A/iNtDA6ntztko56SgSfvZ
         s0ehC6bXa9y2MnUuKnRm+MVSIGcFeqB+M6BdQEIkier54Kx2MyUtvm01/kOh/BjZ5Sn0
         QIrg==
X-Forwarded-Encrypted: i=1; AHgh+RqfHFfjS4Jghy8VTx94ztpsJDtDR0RzgkkOlbIbiiUZoh+oBjPoEWFTDoILF9AbZh1GKB1dCq3mXxk+@vger.kernel.org
X-Gm-Message-State: AOJu0YzIUjvWyr+K66eRIFnW8jSMWaJzlsn9e1B6P5XgpqZuT+OIyNwM
	gC7FKH1v6d7myWHhUrjIXGTs51cOae2nPdP68C7BsMA+4KgWwBjqXYUXrY+P+vqINiGvWV+eNcP
	JaECnWt8azUbPaZ1nCFZY8wyVemx/JK+rLMqM+QzTIhHrB06wQwmfjJB/pPvIzuYt
X-Gm-Gg: AR+sD10wpI8nyKZwDLHK1GUi6TKHCOIaEwHWK5jXouk3H8mCboYHcF7YUN/GxsKjZoc
	sUBhWGViQqOQfZWpJkj7eolXccQ4nT6LwTzTa/ZcTuj0OKEaNh3nisig0KFaAai9cfZRYgFehmC
	F3AkN5FO/fyQ0awCpqYnqc4bBdItcQQB/C4Hao47PwjUIlAgAClaF0+L6kFA6qeYWy4EaLx81X8
	vgH8QqtYfCvZzrLHS7jozj3iGnNJiX0bkWGiCb7rogoqJAS0QzHp1Z8DKjybn5fHz1Tmp+md61+
	1A2OA14aUHnVcGNTqCWyS49/AvuDGGZ4dJKA7xW1fIQK1e5VeLHQ/V0+cQd7K3gDDJiMtjiR2C3
	4gw5f1FStz/S3PGeiIloplceIqVZZ6mUeUNkSBq9FE9lPEOGBxf9CCWhIUBNDhhTRl4lDx7m2mA
	56b3mPhQ5btqSKzA==
X-Received: by 2002:a05:622a:c18:b0:51c:9b44:c59e with SMTP id d75a77b69052e-52d601ec272mr14763131cf.22.1786463696621;
        Tue, 11 Aug 2026 08:54:56 -0700 (PDT)
X-Received: by 2002:a05:622a:c18:b0:51c:9b44:c59e with SMTP id d75a77b69052e-52d601ec272mr14762571cf.22.1786463696133;
        Tue, 11 Aug 2026 08:54:56 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3a0fa5bc0ccsm3355571fa.21.2026.08.11.08.54.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 11 Aug 2026 08:54:55 -0700 (PDT)
Date: Tue, 11 Aug 2026 18:54:51 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>
Subject: Re: [PATCH v7 2/2] arm64: dts: qcom: Enable USB controllers on
 Shikra platforms
Message-ID: <vk5crofplsqmkpit4xtqiahnsunklvxzix5c53wxxnogh2ix3w@65o55mcnekwb>
References: <20260811-usb-shikra-v7-v7-0-753e928f37ae@oss.qualcomm.com>
 <20260811-usb-shikra-v7-v7-2-753e928f37ae@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260811-usb-shikra-v7-v7-2-753e928f37ae@oss.qualcomm.com>
X-Proofpoint-GUID: I_x93g63pQ0gX1rRaNFoOYZHXaaaRw8n
X-Proofpoint-Spam-Info: AW1haW4tMjYwODExMDEzMyBTYWx0ZWRfXxHdXF9q1F9d5
 IqQMvWoZp200Z0M4mzMCesKzB5U38XfcVdgrZCNz+0XT9C1BqeIpUZKk3X/bgsB622inph8k6NC
 6wFRVFz+EcCNaOcEoMTvHQoFa3ZouME=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODExMDEzMyBTYWx0ZWRfXwj1gPUmIExkA
 E2WHRtRfDlF/N51Bkd28c9V5bKVUUjwFJSLIU2ch/j3XZKXVFQCvbEwrbjzw0LkdulPKtJmM8vQ
 IKIUO56ywnmFtQI/+99y1JwMuq8f9We111VF/sqE92fMfN64YU1Le7RS+HYbNrvX4prwH+BIzK7
 nXjot+QOjBOuJhrpHNH/MQUo/7g25eGOxSeCZ7TDsccCZ3Cf3HjOBzFUCOoItmtt1pO3XbcRlSm
 3qFBJh0Z1Ekw4qcyhJd3/8oq/89p7U3HEfnEN2rRZnww069MY6cMM3GU9a2JRiXwh20SBmsy/aI
 kyCLpAG5K7rP/45jor5wMScusc+CX87L/6Rut1d5zw8z4eRrBtIUZuwJW9gW2Q9ycrqY3Iqb1ad
 S4h+eOGUUIQruT77R36d5t8kfPE11M+nptILd4LpV3uVAJhQqmB0q/Pkpy1rETspg+oAKtXDTH/
 W0S+0wyrrqikN7iiVzA==
X-Proofpoint-ORIG-GUID: I_x93g63pQ0gX1rRaNFoOYZHXaaaRw8n
X-Authority-Analysis: v=2.4 cv=LIRWhpW9 c=1 sm=1 tr=0 ts=6a7b45d1 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22 a=EUspDBNiAAAA:8
 a=mkWA_SVPRw4YtxPa1GcA:9 a=CjuIK1q_8ugA:10 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-11_03,2026-08-10_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 impostorscore=0 bulkscore=0 phishscore=0 suspectscore=0
 priorityscore=1501 adultscore=0 malwarescore=0 spamscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608110133

On Tue, Aug 11, 2026 at 04:29:08PM +0530, Krishna Kurapati wrote:
> On Shikra CQS/CQM  platforms, usb-role-switch is handled by PM4125 on
> primary Type-C port and Cypress PD controller CYPD6129 on second Type-C
> port. On Shikra IQS platform, usb-role-switch is handled by Cypress PD
> controller CYPD6129 on both Type-C ports.
> 
> Since those changes are not yet present, enabling both USB controllers
> in device mode.
> 
> Reviewed-by: Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>
> Signed-off-by: Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>
> ---
>  arch/arm64/boot/dts/qcom/shikra-cqm-evk.dts | 23 +++++++++++++++++++++++
>  arch/arm64/boot/dts/qcom/shikra-cqs-evk.dts | 23 +++++++++++++++++++++++
>  arch/arm64/boot/dts/qcom/shikra-evk.dtsi    | 12 ++++++++++++
>  arch/arm64/boot/dts/qcom/shikra-iqs-evk.dts | 23 +++++++++++++++++++++++
>  4 files changed, 81 insertions(+)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry
