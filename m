Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BAAC143A80F
	for <devicetree@vger.kernel.org>; Wed, 15 Jul 2026 10:24:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784111092; cv=none; b=A4G7yLAs+qinh3m8yJWIHJYLntZSbl+A7o9SHotkg6F4wGw3nJ5ZzoiCCClHTh9aZODB4zP5eZ5CquSLZhmvMr+GcVfaOyWe0jeWOXzvaacQSuaeVmUm2Qbv7n5ot7o+1nAuJS2FsgHm/72gGjcL9/i/ag0rKl2ItOhBTRMIX5E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784111092; c=relaxed/simple;
	bh=eXcNUX87zt2YLPyGc7yI0u/x15olO2OCJZ0KsTB3Fpw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=WngKVlhU3bpIIWYEbWdz75V8bHAVM3D+i3TSvKLx2kMVZ2XsQyRYf+ZXQ7ic5PPaqDzXAb4n7YMTFQxCX08fUMozsM4zHi2TES7bgOu0PvB6f+eHB1TIMO2XtklAfpT9EbGksehg9fnYjPL5c5dn2uaNfFF73iLluRwLFLYB1VA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=jvnlElFp; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=D3N2dJDx; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="jvnlElFp";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="D3N2dJDx"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66F92qYY160921
	for <devicetree@vger.kernel.org>; Wed, 15 Jul 2026 10:24:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	+KXDtuoW/w/jNWruPD8XxFqjMWfRw4by6Xh/mpiNICM=; b=jvnlElFpoeduJZMD
	EbHAiGKQR970nwBUtHO8FlMw7thSGDVWfpcbLl5M1Kj+c20B4SbNC8HtZqg2V9Ux
	9NnS/1ObbFyHU9cr9BAdhaQNs2UiQw2HYIW61KdKt4X4Hqz7WmsEt70sAb4ZyB+z
	j7Erir8FpdzoXhxDVujO+tqA81tXgUsUXDiMqlmI7Al/fsQup/4lKDIGzhBbhb0P
	uP58UdqikQ4n6YksAAQHV+hS26ZY12F5rvK9bdV+6hACFfi74ofD7tD2P5TVCnYO
	BvwUvzeUH20MZ2VMlkD+Jbe9Bo8Yo/0I2rsI9vPIh5zUrZjHu9teB6HvdaWrAb5S
	tlE+EQ==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fe68wrj0p-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 15 Jul 2026 10:24:50 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-92eb5f54b6dso94339485a.1
        for <devicetree@vger.kernel.org>; Wed, 15 Jul 2026 03:24:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784111089; x=1784715889; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=+KXDtuoW/w/jNWruPD8XxFqjMWfRw4by6Xh/mpiNICM=;
        b=D3N2dJDxRoVmLh0FAJQpviza665Jd6g8dit3E2bhoLqTom3/AHMFqLa1TF5Rn44/0b
         HiY2oeeFUMgMUIKe+gtgmuxB87oratS2vvwsZ/dXx7KBjhZcPIHJNDffNwkOScgcA/uJ
         7klyusz0PPJb9Fu0NPaJiBV5WNckR6xLN7Ml3ESxoiQ63bA5PP7Mvmt1ptRAcW15V8xn
         DAc8muleQ2kORsDBhYJRFIWALdT1ThjOb3+6UYAKbdtoW7+dFgUtQID3Pt3YI8fSZQ3U
         1Um5fLz2/rw4xul5sZQM2vENDH8xMMr+hjOrHppfXcyUDpvPdJLpT6I5qcjG/WnEBmNJ
         qRDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784111089; x=1784715889;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=+KXDtuoW/w/jNWruPD8XxFqjMWfRw4by6Xh/mpiNICM=;
        b=Nck8nz8NgoAs9W0xtEQOih85FsXvGMnZW+u/nW4jDTTZi6SeXx8TmpmwRWtlw5I1zG
         lg4+IOkma0ZlFK4QQzMa+5uFMO/jUOgCFmt2Luev6vaca+LKSaMVgc4oJWW9pVSKuKnI
         IH/9IJDeYOOCrgt0hBcZKy4CJeTccxMnlBY6SPi0/esGbJB1N2xRpaYReUfEZUefgXAN
         bEZGvtPs0CLdW4P9vOuCSVhWGnAttP3sR1pFrvuUaF/vmTz/MogGXDnP/jFWtFbtfvpT
         HUxNQa8aG2dq342RkxmUvuhLfEKX+YG80YN4tnXEcygEhA4ko0ZQTLRzKe6q83p/XDwz
         vM9A==
X-Forwarded-Encrypted: i=1; AHgh+RpcKzRpn8Xyjuoj3lrifYBOPRgmrIGwoXey53J5IgbAjiPh9sURNfTrEjCM1nPKLFnvHZNY++Nxnq9G@vger.kernel.org
X-Gm-Message-State: AOJu0YxtpjvYOJLf+0Gibl1R8exMMeSs8uMpNu22ByFSHdIiUlwz4uEM
	DvSDHrTxFqxSJpzcfsaFJXzGyu9k2Sp6sb7Le5fhI+FOhgntgn17NNFipKZmNv10cC8qicYegxd
	m2mkfF74Gw5Nr39PuiYYaSZvvLxFkv4zFBDW420nE3ebiN3iNL28o/QIltR3STcCM
X-Gm-Gg: AfdE7cmgt+U9Wc8tD91tcxhIjSLsPyaQJ+LrmP2G5OHYQ4gtdRKwq6aeR4aartvEGWN
	/u8oT9v3sRqdT2yfjvM1JUjdEzf3mZgHuWLbGePb27Q1RP2ardbCdUvgPLlbLTdsZFAWty5dXV/
	u0A5o3OKwjlY6S6mXP8P1TeB6SJhg/1qdAb6KrGz0lmcVszKNxTQxZWiK3n6Qc7i8FojZVyG8EW
	xYnDV9km6lolWTl/ro1fvmF4WWY4iVI8JaUCE5lP2GVhzeBdXf7+9kOucl8aBlL+R4T8mYXWFC0
	aXlhzITJtQ/e3lXdopvkapqyvlz4nDInSaL0h144NnnYU3DJfWhXRwItxlH9b3GLzUL+HdI7Plw
	2mQaAxQPHFu36QK9aAuZG3jYiD7UZ2/d32Ws=
X-Received: by 2002:a05:622a:10c:b0:51a:8c9b:6492 with SMTP id d75a77b69052e-51cbf2aad75mr125800371cf.9.1784111088897;
        Wed, 15 Jul 2026 03:24:48 -0700 (PDT)
X-Received: by 2002:a05:622a:10c:b0:51a:8c9b:6492 with SMTP id d75a77b69052e-51cbf2aad75mr125800231cf.9.1784111088458;
        Wed, 15 Jul 2026 03:24:48 -0700 (PDT)
Received: from [192.168.120.193] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c1687166b94sm233266b.17.2026.07.15.03.24.45
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 15 Jul 2026 03:24:47 -0700 (PDT)
Message-ID: <e8ef4ec3-7279-49e1-9c4c-4e316c2a42e3@oss.qualcomm.com>
Date: Wed, 15 Jul 2026 12:24:44 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/3] arm64: dts: qcom: eliza-mtp: Enable CDSP remoteproc
To: Abel Vesa <abel.vesa@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260714-dts-qcom-eliza-add-cdsp-v1-0-525e757a23b0@oss.qualcomm.com>
 <20260714-dts-qcom-eliza-add-cdsp-v1-2-525e757a23b0@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260714-dts-qcom-eliza-add-cdsp-v1-2-525e757a23b0@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: clKG-CyTvcvYXYFFy1Evew2P11PjPUIU
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzE1MDEwMCBTYWx0ZWRfXzsos8ZMDVoqJ
 U/53Hdo+Vq2AmJaJn1vyde4OwRZN3lgjnYGYWBVSdHAmJUQQIa6cy8DQkxDJ7xtIThNSM1ZWrxU
 6pxbk/6lHQENPYDgoEeeLLvvwQ+YLF/wJOzo2wPFPVwtq7OmNLMut03ap/2x6M3Gna8sezdoyQc
 2AgsJoU6a7I5BF9IpJ/eZDPVdm5uBam/j47fEg4+22VCkynB4ighkcvwYNMUKdM5HuZhjHxKlge
 RIWv9kdgGzyIfXFYlu9Li2QAQygONjjYwJzjjz4PLGgROkTbM9/5PMNDrcmOU0CiuxqaT0a0pmr
 rT2WmmQZ/B17Cet8UK4pjwWzX7ximntrmmC8MQSuPMKF0Dz2awIikS9TCDT+F1L4YoiYBmogn5r
 UMuEI/NlIe0tKMXSC5waRVrcc9aDTdy4+4rxV57i9op1q5Iyzh4BtY2YSK3f+dsDJiz8rs9xiM/
 FfKTTc3N9U0nsqE2HLg==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzE1MDEwMCBTYWx0ZWRfX8FCV4zfD6E19
 OciOL+DlNT3N0W0+wPT1TeZC0Jlru9RPQRkXIEeI+FIEk1F0eA3aIVZ5t4iSaGvjpA7vNCC8eYo
 bosTV9NmJHrZJfoy0c8hKcTUsRQtqxE=
X-Authority-Analysis: v=2.4 cv=LbgMLDfi c=1 sm=1 tr=0 ts=6a575ff2 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=tD95H0FGCAwS4eKOgloA:9 a=QEXdDO2ut3YA:10
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-GUID: clKG-CyTvcvYXYFFy1Evew2P11PjPUIU
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-15_02,2026-07-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 impostorscore=0 suspectscore=0 adultscore=0 clxscore=1015
 phishscore=0 priorityscore=1501 malwarescore=0 lowpriorityscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607150100

On 7/14/26 3:06 PM, Abel Vesa wrote:
> Enable the CDSP remoteproc node on the Eliza MTP by providing the firmware
> names and marking the node as available.
> 
> Signed-off-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
