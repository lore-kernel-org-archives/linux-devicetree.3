Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 066DA3BBA09
	for <devicetree@vger.kernel.org>; Wed,  7 Oct 2026 13:41:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791380484; cv=none; b=UatLFwXmADJsoTcVVlEIjXPP2rluydSyeMaKnSoX9LHiJkE68e1O+O7a6RGH9GrBYQ1Y4xlpfsiAURwStBWEd83XH5OUF225MAAUJQxasX8tPeAXobOeaTjI+DANWP3IdAFm2UfP6GlPdTb9L0EXktAcHB/rULOSK8VTSy+S5pI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791380484; c=relaxed/simple;
	bh=4BPC0RAv/+Xo6vftw0wqtFLt3xYpSNLwUfg/BFWjavE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=is0nMR0XNwFW0DlMvyNL6FmJOpsghvWWf4TmpNUO96X8mU9bjTuoufeyNfYn9GfnQoVyHeL+1jq2T6psKLkoIG0tWnnjDzs41bRIPEcYHeduXLVpclS8dIwsUS7ygB1leLc7McouYJwvpTxBnWL9J6ukHL70E/nJ8glGWiv0nak=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=V2Mj5czW; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=X1fh8hsn; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="V2Mj5czW";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="X1fh8hsn"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 697BVHPP110202
	for <devicetree@vger.kernel.org>; Wed, 7 Oct 2026 13:41:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=RdsEo7LuSlTCZLMr1If+IEH1
	EDpELJpDjjeykvuSTxg=; b=V2Mj5czWbOeDLkaf1/6l5Q9Un3YxHgG0WSK8yVWF
	gEVQGizxkMhfnz1N0H3TZ5YXYfmaCyUer+HTffbZDGfgFFXwvgen7YWHLNpXAuGu
	EN4hiJBkZM5323aIWQHmI3uZOq4Wvw3jDD52PUhAUr6LnkziDhc9FG/MVp8XOYd2
	hzmlS0El8OEeCqSB7C55gK3s4JTD0p+J0Stmm7iHs0B79U5k5GL9MbA+bboefl4l
	VbukOYsKU+Wl8XBa0jLRNRGgyE6eIH3Tij6mVRz7A3TgZ874wz4+zpJoyJnYT3QZ
	n01RT9JWwfhrn8Ht2Dql5o48r0zBIWLpIARomW0AzT5htg==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h5gvrsf5g-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 07 Oct 2026 13:41:14 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-939c30aa9a0so478513585a.0
        for <devicetree@vger.kernel.org>; Wed, 07 Oct 2026 06:41:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791380474; x=1791985274; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=RdsEo7LuSlTCZLMr1If+IEH1EDpELJpDjjeykvuSTxg=;
        b=X1fh8hsnrpk4vqoK6An5K9xHcGmpQCAZe3sMTKoO1flTqcP3ppTUfAkdV3QAsHIU+g
         kr7zZtPv2foCIbj61T69iSONp7lF6ghnRgWglQb2xDElvsAgi826sZ1mQvD9XnHGq7NQ
         GhAvDs2cVW6qYJzaqz9jF32oNrVlAlaAGaSwpZ6ZjB+ckabM+BTmYK3mOeaoGPeL+szW
         EHEf/Vo2Fc+q2AjEKn5xWICqBusQRkpfUA2ZtZLWSYSTt8lUA8egjLEFqbejwXcJWV+J
         6r1nnTppoChoWKiCD0qLfmZatC2zyCLfW118IipfcrqAXmm+mO5t+lGPFa/XG9BunAdm
         kA/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791380474; x=1791985274;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=RdsEo7LuSlTCZLMr1If+IEH1EDpELJpDjjeykvuSTxg=;
        b=mg+s4e/UFyMTowLlNUkK/9uaJT/iGyjQcjTZHqj9AvOH+hU7WNYill6nWgbI3Mt+pB
         Zcfy/xAf+liVXVVbQ5LTPODxHq0Xc/Fze4wQ7gZ0doFzProWcp9HRXvl4NovtZ1lHDMe
         KEWMA+ku7m1BdsWEgOregG5yb9Bp7ovKBw88rDiQ7hh3B1yBfnanAObJBLQldXmHZTBz
         2q9sfANil45pysc7Inwzj1KdiDbzNE4PtHTkR7Ks+VCEpHFxHEGeL5a/yZaNv8ZVXazP
         H6wYUWqfoALytEUazpsUKL0pA+FXLzsAzzR9Z4/gw9zDQap35CrnuR4gr+7g6jJfIqVp
         UmiQ==
X-Forwarded-Encrypted: i=1; AKwUvBzms9m38wJrcSoWb2XU7PwjQMn6IrwXwCr2hWR9rVBh/nX7iWwvvsgCq9hKXp3qGhMplI9HmihP2hYq@vger.kernel.org
X-Gm-Message-State: AFuF++mrA4GWQCf2qG9iGGF4rvnd/spM3+GIaQlwr0t4RwkWgDBWaU2J
	8Zv0kVNjpMuGavdzsada4+pRGEqAcmvDc5f57LaYtxCxg569LRIX8xlnFOqPtHGGmvdHhzZSCts
	wXLNgQniXXHCf++vDMQsXIFmf57eWWsIQkswGKmJ7/hK2wuNsMC9KnvOT8n7LMGE/
X-Gm-Gg: AYBFou0yqE/4aCVRJUdTxRndax5ShkB0mFRGZqz8v2rtbub9OanOgLuP4i86ijWNIo3
	eCoMOI7HulYm34Ar6jrHLngWh34eVjNRv2BCZc1ZGvK7B9MzamJIqyQJmzCllFiMSIyJHEv/LGP
	S03HhgZCpE4UvuIRFVdztVD0Xy//df0fLdn7nN3v8dI2JZKM1f8M/PUhdbxFAQyf6fohvcZwODf
	jxzDOB/TQNeuV6arUYfD+ZEFmZVwxoDjJ3hwGFIOzq+wQs3J0O6J7skAzJygN1nu63LxyGbHiiy
	rALd2Z+hVe1ciq6TXuG62hmTeJFreeOcVFZkwR05RC53jFFp7uFPpcp6+1+1e/Hu7ugADVQ9r1+
	24v7/5E0dzWbjdL9hO8fhDxPVinU6Axvs8AAZrivvjFp7LFk2vv8LZQqDDsKw71uAFtC40PNh3S
	TgZQigNpJVdVoK
X-Received: by 2002:a05:620a:25c8:b0:93e:78b7:fa4e with SMTP id af79cd13be357-93e9b7865d8mr428384085a.37.1791380473877;
        Wed, 07 Oct 2026 06:41:13 -0700 (PDT)
X-Received: by 2002:a05:620a:25c8:b0:93e:78b7:fa4e with SMTP id af79cd13be357-93e9b7865d8mr428379185a.37.1791380473285;
        Wed, 07 Oct 2026 06:41:13 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5bcd3083376sm54026e87.43.2026.10.07.06.41.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 Oct 2026 06:41:11 -0700 (PDT)
Date: Wed, 7 Oct 2026 16:41:09 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Mohit Dsor <mohit.dsor@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        venkata.valluru@oss.qualcomm.com,
        Jessica Zhang <jesszhan0024@gmail.com>
Subject: Re: [PATCH v4 2/2] arm64: defconfig: Enable LT9611C bridge driver
Message-ID: <riv4zjtk3apvkvrkgkhsgl4uwnuggefda3uu6z4czelgfd5kif@qubcvt4k4czh>
References: <20261007-master_lt9611uxd-v4-0-9986704e2a7b@oss.qualcomm.com>
 <20261007-master_lt9611uxd-v4-2-9986704e2a7b@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261007-master_lt9611uxd-v4-2-9986704e2a7b@oss.qualcomm.com>
X-Authority-Analysis: v=2.4 cv=W66txhWk c=1 sm=1 tr=0 ts=6ac64bfa cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22 a=EUspDBNiAAAA:8
 a=Q6lPxUuw6KINYsX_g8EA:9 a=CjuIK1q_8ugA:10 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-ORIG-GUID: gMzBs07WDpzg4yUQCtjzxxaPlyiuRbsl
X-Proofpoint-GUID: gMzBs07WDpzg4yUQCtjzxxaPlyiuRbsl
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDA3MDA1NCBTYWx0ZWRfX9SwlmPYsZ1Hi
 C5QoTrf+SEmy9dprMFmpnLivwaUJhIqMmFdNoxtcB1n5Fh1dIo51pL5mGKa99TjOnscMT4pVPwc
 5AY0f8menCsEe1EdaKm2h+ThcwElMWqemrwGYAHDxutu3hxiBnWCUyPIT+VSP9/sCxsFQrR4dIO
 HhiG6Vi9hO8QOB1XoFFXMope+O/piPnK7Xj9XfSUpZCCX8vWbBcHiXbm4KR2wX6dEJLo3ZtdVd3
 bwoYn+q1/8DfIwhenpAI/ZG5IzzSIs8hRToM6woOK0l/gadCNfojRKJN15j8ln5Y8IRCL60as8X
 oH8RFxlN6ZqgOQgM+6AlQf5vGLcjWyPq5Etjd93eiGGJnoiePp8t6f2/e5T3bC9A7l4H8O7k5Jt
 iwfiAHrNBArmJkSI4cwg7ULBCkRCf/wp0xoxay3nzwhUPpNu9Y5gJKqO71ZsifXzmdhoHvl7sHr
 OP4WCEyX31nP068uI/A==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDA3MDA1NCBTYWx0ZWRfX5/xLPjw86LT1
 nolhPZar7lwkEa8jFel1JYAUapFQ7x0yXeSSz/frX/Sq7B4tLK0HUZXKI4sHC8X8w3gCThzotbE
 1r52u96VsZ5Xa/ECNZ5/QId73n/9OSM=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-07_04,2026-10-06_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 phishscore=0 spamscore=0 bulkscore=0 clxscore=1015
 malwarescore=0 impostorscore=0 suspectscore=0 priorityscore=1501 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2610070054

On Wed, Oct 07, 2026 at 06:21:07PM +0530, Mohit Dsor wrote:
> Enable the Lontium LT9611C DSI-to-HDMI bridge driver as a module.
> This driver supports the LT9611UXD chip used on the Shikra IQS EVK
> board to provide HDMI output via the MDSS DSI interface.


Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


> 
> Signed-off-by: Mohit Dsor <mohit.dsor@oss.qualcomm.com>
> ---
>  arch/arm64/configs/defconfig | 1 +
>  1 file changed, 1 insertion(+)
> 

-- 
With best wishes
Dmitry
