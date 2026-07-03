Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C8E293C3BE6
	for <devicetree@vger.kernel.org>; Fri,  3 Jul 2026 15:07:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783091230; cv=none; b=aTar3xeR6ge3bCMZGV1fptqrgzYCCU6iWsjbqesPJ3C0mEOk/0Zn1evSkwKs0f/H+2g2FVY8gQ4YAOJyKbMSlSwsBOkxoiAy22OGEDpIk7R1IUhmT6jqLPPK9OodSkm/z3ZqVikJBdOmi5aSi0fxfcuJpotW3re5HZqZV+WIM44=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783091230; c=relaxed/simple;
	bh=0w/d6iSpR9UaaKp/rDddcaeduOnJK9KBBmjSerbTYtU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ewfzfFsfEcUeIQjQvKCIOxzRu5VDAjXxbE6tHO8+qcqooBz8GB8c2VV+Zt67k9vwxqNO6tdvKr0cplmMwV0TUe46ETmKDHWt23sYS+/08J8L/Jp83r8D8Z5OB9OFJ1nFcL1Qe5hgweGAA59JLD8CvTufsOPJNyKq48ncjMqZQl4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=I2laStE7; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Kk2Nlrbt; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="I2laStE7";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Kk2Nlrbt"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 663BW0di3053805
	for <devicetree@vger.kernel.org>; Fri, 3 Jul 2026 15:07:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	g/Y1MW5COel2wWx4p2DALR7RRNLnSVd1oYyWrSpSJXk=; b=I2laStE7JVO14Zny
	RUxphdbyneMw1OsRlTiKt0N99oI1NUu4z/tGStXgdRwGaWC+kYOJ+B0YCoFSgdZk
	3kFuL3t4LyLKsVcAQDoHbZBAdp6uHK+DAp1Lvyg/4TDPszJd3VK2f1OAfufBvxXB
	HWDTC78TO/jS0BMzX1rmYzGuPS6h6LYKvonLQlGWwobLQEmNeTVNVD4wtPSFw69b
	/YWG2WQvs0zTl/iG/65M0nNCwOOvyH982WAl8ISIzOHiWx6RisnoNPrGzuYlQBIy
	r2Ayt+rO6n7GP7/qDetmB7+9Y3D3G/UW048SZ4923U0oQOznFMwLEf/z/Q75j3d6
	OswDTA==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f67j01xx4-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 03 Jul 2026 15:07:08 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-92e66fe6152so14504085a.1
        for <devicetree@vger.kernel.org>; Fri, 03 Jul 2026 08:07:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783091227; x=1783696027; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=g/Y1MW5COel2wWx4p2DALR7RRNLnSVd1oYyWrSpSJXk=;
        b=Kk2NlrbtX5tIlouE3x/4D2leuzq3KKQeJkZ6SIOpP4gpp+0O27zN+6VCWCeQthxtEw
         COoV1yLlqG2x0C1GWyGgS7EE0O3/H4eJ5pTDqKN6vBdI8oPkqHoxwg4wEsM5lN7INizC
         MLJUunjdENKia5ngfeMH5UkO8M/IzRjBUjg/6jyaAfHuw8qZ/QP1Gzi33R0XrTczBIPP
         Y5DRjclspOpKfHge5B+AkA5Et2N8q1sVrdaTUbPOtL9+BPP4FeUgoOlofaNgD05nObgQ
         yrgKIoph51MbdBib+UuE2TFfcvym3ohQBR3yKVI7oFOhQuDfC9vJdkjqhjG6ZkHVL+Km
         pYYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783091227; x=1783696027;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=g/Y1MW5COel2wWx4p2DALR7RRNLnSVd1oYyWrSpSJXk=;
        b=lDsjspuc84+F3BrPmto4kB3HyOeqQ/y4wnGmTyupZmoCq1xC1KaUCSMB/LkO4vVctT
         67iIHrhAnCZtrjERM2rowmxEnalZ/e00pcCBFd/W1q2jL5KchzPa7vPYL05Bb8yc5lYf
         IAVsp5g4JQG7ExJtEAbdAXT9tF97TalycviYlhpUgFo0/xjIhvXvnRbP4gPkXOWch5TN
         cDXRKwhJXH+z44oEFAMHa4dzx0/N+t894XkhYNZc8Qiawnkprbn6yyHvD0ngYlQvnEDv
         f53zUU2XDj+HyPH9G1xbTFu5U6dNR+s/0FcB+mjtI3F3NlZd2WyneJY67ci9BXZTX5UR
         s6Gg==
X-Forwarded-Encrypted: i=1; AFNElJ+8kSEv1FXaDasCPfCR9HWx15V/GBLh84VD22Kh7HwLWipMnQKWITMsy4omlCDQvt266vf98/+9H54Y@vger.kernel.org
X-Gm-Message-State: AOJu0Yxf1zmQCU4zdp6Pub3Hopu03xyFKaOFyzNxc/6anHI7z/tUYHIT
	7G2ErK3Kk+SjWiKdSn/6KZhC+jFNZy9QcUwieN0QLfDEzaFtr/HA4sj64LpSxreeFQINnXjA6uw
	hx0LEU4X2jT+6TTxcMtPLfPWR3mV9u+X+b2M/fAgvKYq4/pOP/47bc/rIl1fU+G+v
X-Gm-Gg: AfdE7cniqPrg81w4+KYETyhLMpxMTMA/Weo/i5m1/7BnMOHEsoxaRatJE356y6efE7v
	ewU0IOPPDs5k2gstqYdqX9o2rFdUwQx0MtQfl6m3lQ2r6stZq8Kjs6UmFj3UaW2/7Ot2J7rIeV+
	6XV3eKmkvWJp8gftU6aVCRSOj4cwJPsaIZHrI63nc9OGLYpZrpYBMGKe5yTp294e+KYweafaKVa
	gNol2tTBEUFpy2skj2mCO/tYnwL9KfCZJFJXSIP78/s8CwEWxE7HsOW2k0lJv31sGwAVpBt43Sq
	odxGPkH2xZ0y7tLTfaH5rsflzkWpFFljs3c7h5Ht3h0nEhfHmGNgL7UHwjKpFZ5WPV2Kk8eYGXy
	ztGvMdjnKRQJoT7U3V23D2VFeVxFmW7F8EUw=
X-Received: by 2002:a05:620a:171e:b0:92e:705f:1626 with SMTP id af79cd13be357-92e784f65a3mr825406585a.6.1783091226862;
        Fri, 03 Jul 2026 08:07:06 -0700 (PDT)
X-Received: by 2002:a05:620a:171e:b0:92e:705f:1626 with SMTP id af79cd13be357-92e784f65a3mr825395785a.6.1783091226326;
        Fri, 03 Jul 2026 08:07:06 -0700 (PDT)
Received: from [192.168.120.193] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c12b628d65dsm295433566b.35.2026.07.03.08.07.00
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 03 Jul 2026 08:07:05 -0700 (PDT)
Message-ID: <a2dd4a61-2585-40aa-9d05-18b66f3450d5@oss.qualcomm.com>
Date: Fri, 3 Jul 2026 17:06:59 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v9 01/14] firmware: qcom: Add a generic PAS service
To: Sumit Garg <sumit.garg@kernel.org>, andersson@kernel.org,
        konradybcio@kernel.org
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        linux-media@vger.kernel.org, netdev@vger.kernel.org,
        linux-wireless@vger.kernel.org, ath12k@lists.infradead.org,
        linux-remoteproc@vger.kernel.org, robh@kernel.org, krzk+dt@kernel.org,
        conor+dt@kernel.org, robin.clark@oss.qualcomm.com, sean@poorly.run,
        akhilpo@oss.qualcomm.com, lumag@kernel.org, abhinav.kumar@linux.dev,
        jesszhan0024@gmail.com, marijn.suijten@somainline.org,
        airlied@gmail.com, simona@ffwll.ch, vikash.garodia@oss.qualcomm.com,
        bod@kernel.org, mchehab@kernel.org, elder@kernel.org,
        andrew+netdev@lunn.ch, davem@davemloft.net, edumazet@google.com,
        kuba@kernel.org, pabeni@redhat.com, jjohnson@kernel.org,
        mathieu.poirier@linaro.org, trilokkumar.soni@oss.qualcomm.com,
        mukesh.ojha@oss.qualcomm.com, pavan.kondeti@oss.qualcomm.com,
        jorge.ramirez@oss.qualcomm.com, tonyh@qti.qualcomm.com,
        vignesh.viswanathan@oss.qualcomm.com,
        srinivas.kandagatla@oss.qualcomm.com,
        amirreza.zarrabi@oss.qualcomm.com, jenswi@kernel.org,
        op-tee@lists.trustedfirmware.org, apurupa@qti.qualcomm.com,
        skare@qti.qualcomm.com, linux-kernel@vger.kernel.org,
        Sumit Garg <sumit.garg@oss.qualcomm.com>,
        Harshal Dev <harshal.dev@oss.qualcomm.com>
References: <20260702115835.167602-1-sumit.garg@kernel.org>
 <20260702115835.167602-2-sumit.garg@kernel.org>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260702115835.167602-2-sumit.garg@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: 9kN8pq6ELShq0A3HXbzOCsEOMeT5iduM
X-Proofpoint-ORIG-GUID: 9kN8pq6ELShq0A3HXbzOCsEOMeT5iduM
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzAzMDE0OSBTYWx0ZWRfX2Oha6z/mQidd
 ukOTzSjtCgclhpdXIHrRcTqJynmyF1ZkC1/bkZJHkebDvkq4vaPCq/GFtclQw64uGYLTKL3IvwJ
 TlkZWBcxqTQNSo+wqO42MVK9pbWbOuE=
X-Authority-Analysis: v=2.4 cv=Yuc/gYYX c=1 sm=1 tr=0 ts=6a47d01c cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=DWWpLck2SfFL7czMIZ0A:9 a=QEXdDO2ut3YA:10
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzAzMDE0OSBTYWx0ZWRfXy6i787rc6YIT
 yn0gKCIMpeuFF9gVkpFa+4YtpIDQoosFuIHUeYsFqxxOBANMkaQJmmWYBhTC+RGkZGxR8K8/Vv4
 hH4QykCsc1ekMNlYdZUxvbOwbxrFvh6bq8I8sckMJ5kjWeXfEve15NaWoHjG9zUfil5PpfV/ZOf
 IFQ1PSc1jQO3/8YFSC39ppT8fqhUXFTp0mjo80b+mXMbhFzLCpUKrQmBklL+dEjnadhJfQ2MPYL
 0VTvhZBaSG+Jxne7lRjxLl4skqFyznlKG1jGvVeanblUBXi2W6ITfszEqwurGTF6w9EOnrjsHVZ
 5QUTWRMWb9LorVqFe2qBGo0mAinf3uJehl7UFGo4EeUEtzbQp/mxxMDkr1zPZuE4JP/nLJTWdRC
 nCoNjVkoNi1ngOUNFHSB0eV8QJQ0Y5gQaUR3ZrvA5lf3PQLQpsykOOBhkiNlODgttqD6L0MbWBH
 fP9Xe2eciWGbuBZeCUg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-07-03_02,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 malwarescore=0 impostorscore=0 suspectscore=0 phishscore=0
 bulkscore=0 clxscore=1015 adultscore=0 priorityscore=1501 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607030149

On 7/2/26 1:58 PM, Sumit Garg wrote:
> From: Sumit Garg <sumit.garg@oss.qualcomm.com>
> 
> Qcom platforms has the legacy of using non-standard SCM calls
> splintered over the various kernel drivers. These SCM calls aren't
> compliant with the standard SMC calling conventions which is a
> prerequisite to enable migration to the FF-A specifications from Arm.
> 
> OP-TEE as an alternative trusted OS to Qualcomm TEE (QTEE) can't
> support these non-standard SCM calls. And even for newer architectures
> using S-EL2 with Hafnium support, QTEE won't be able to support SCM
> calls either with FF-A requirements coming in. And with both OP-TEE
> and QTEE drivers well integrated in the TEE subsystem, it makes further
> sense to reuse the TEE bus client drivers infrastructure.
> 
> The added benefit of TEE bus infrastructure is that there is support
> for discoverable/enumerable services. With that client drivers don't
> have to manually invoke a special SCM call to know the service status.
> 
> So enable the generic Peripheral Authentication Service (PAS) provided
> by the firmware. It acts as the common layer with different TZ
> backends plugged in whether it's an SCM implementation or a proper
> TEE bus based PAS service implementation.
> 
> Reviewed-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
> Tested-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com> # Lemans
> Reviewed-by: Harshal Dev <harshal.dev@oss.qualcomm.com>
> Tested-by: Vignesh Viswanathan <vignesh.viswanathan@oss.qualcomm.com> # IPQ9650
> Signed-off-by: Sumit Garg <sumit.garg@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
