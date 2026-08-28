Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C0DD140F726
	for <devicetree@vger.kernel.org>; Fri, 28 Aug 2026 10:20:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787912407; cv=none; b=baxyuIpkqavds6Cp2sSWfYj0UPuvCIpSecRQRXJMSSUdxVNcdmcJzNwZ9xypPjS5W0sRxNI5DeiVpM/D5L3FcquRfQxOj11Og1+RkDt3V9Leuc9aFt17xdNksbXzmu+TP9PCcTLb8om2627YgUg7Zl912sdfAa7EFyQ36nmNbV0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787912407; c=relaxed/simple;
	bh=wPDRpUUt3k6DUZPeI/GR5CvhOp29Nug8zMsDwdUkNrw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=qkY09fABsx8G+AQiPs4Ed3Qrz0Lce54+YaB1TXnDQKXt+7myCO6jQLLtc/15kTvi21Za0wvy4bNloZ2DkpN6uxkLXt7DayW/iWKM1EHzJ0dKXwrU7NxS0owqbdOEQyiN1MusjBd2Xtk2C3U4EMPP5YjZ5LT2D7WjfYvF796QfX4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Vrm8Jkup; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=NeOcl55t; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Vrm8Jkup";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="NeOcl55t"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67SA7aIv2168318
	for <devicetree@vger.kernel.org>; Fri, 28 Aug 2026 10:20:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=kv470VlsqiYxTGPBcJP4Hwxx
	vMWmpd3nC/zdQYgYSuw=; b=Vrm8Jkup8UchPJHy2tbgzdGxCB+BI7zn8MlU211S
	6eNjzfSWxkoFqnVBAnr6Q6i50ie09wJddEtR5mTgwGc/PmoqqakDtOAHliQnd8K1
	D5ieEQ7N5dUnjEASTz5LsGS4p9qFf1tILBoVJMnz0wv8YIyJSTSNcOgbmy6ugU7z
	Ue31Dg3c05WU6cFZ3LHMxORUXfSM30hkbSRm8V4VGHC4sy8GakPx9Kkb6eAaFfus
	+7GxbP69yFrcAZbQ3aGtODqTkg9FPs1kgpzTI0U873UbtNMe8PhyXgIAheC9NdzB
	OjrnUqRj13knRneycOyE0Bb2r6OLzHjbm2eHZcn/DdqVRQ==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com [209.85.219.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gb6h00h5y-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 28 Aug 2026 10:20:05 +0000 (GMT)
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-8eec6acbe21so18499746d6.3
        for <devicetree@vger.kernel.org>; Fri, 28 Aug 2026 03:20:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787912404; x=1788517204; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=kv470VlsqiYxTGPBcJP4HwxxvMWmpd3nC/zdQYgYSuw=;
        b=NeOcl55toRxIkRSCLmNXyh6SwI66PsEeO9oWj348LrMpkZdiSQu/DwQcZPq8emg+9p
         oDTmGcD8KRo/T44ogbTcRJvgqX1mZZp4SjQdJ8ZWvJzPhkoT5654waHKmJHibsmCwGQ6
         oz7vCbmPnuJ2XOBbzaIVUX/TXnI5lvquUK3wql4UmQDl6+h38iw2ugVJ6fcrIVduUtlY
         XlJ03IY5gDQ4SIziCEV6mDimw0AxbB3t2+h4JJfRAlwtFdCrPXOA5+pzFnOmjUxO+HHL
         reT1uPm5cYzkBukfZUIfOCbFpvJ4V+c87AtroGFThMpJ0/XVK0JLFF8HW01THFzheedD
         YVrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787912404; x=1788517204;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=kv470VlsqiYxTGPBcJP4HwxxvMWmpd3nC/zdQYgYSuw=;
        b=VjAkW7qDwLr5SHjWquXhcuxHXzFGBmSlmQ6mZ+6hir2/neTxGZDbLdPJnWOycDNT1J
         bjpGnXOXaSrppTcenfsmA19IEbgZZTk/d/m49qDCVk2Wumb3zv7d8FmfdUU0aiJ4f6Nr
         JkNZk+yuvBtApyKRKTM9pUhoRu2ICkh1GfJDrbAo5V2BZW5Qrw1//eLRHc3ZJ2hXfLbv
         fn49Dh+Ug7JTM5/oJBY3JgFpAcKWyVkhxA2Px98b8rgQFd+pA8DIhH8EdiqLZdLWYQDG
         f6/VqGmiGo0FNWldymdxMrmNjCw9bRzk49e1s9YFxXRupspK9NiyoFmfG+1bKF0INHpH
         4fKQ==
X-Forwarded-Encrypted: i=1; AHgh+Rp1JJdwcLA0uMFj5KZDaq0AMPkpvwp5hPL+PMS4rYcerfW19a8bXo9SrEDyPYI1yLkfdjvhlKjwzy6C@vger.kernel.org
X-Gm-Message-State: AFuF++mc44aJAUZgV66onJah56Xk0g+bEppU1aqR30Jb7MnYpnOIRbBl
	nsIATVnX83eBkd6B+Wr89WJf8dLUGXF7h/shT9YFjTRwrwx2UyS6rwnuKoquJ0xNaOlnJFNs8vx
	cmPOctkl/oS9A4Va957uVaRpgortuZpHacYuzWxW1lh2+xaP2waZW8FR+ZDsMukui
X-Gm-Gg: AR+sD11v0981sZnM+kN/QOjSTQFuReRVpvBKyeaOtbyLVC8kmcTz/LHuKw8gkKOajJC
	KG8u6FybbkfFKRixKmZ5hyyJmcXUbGC9f8Po8X+/ICv+tAJfMFgJF032dk51nwknmji74R0EQRx
	OJC3daTn9F1v6nrCN8PLBcS8cijRe778x0mJJ0VZdfz4ylycgvXEd6SBSJqjSKvOqy7CtXK+lhV
	71W/2opu3zNbJV5OtaRTIuZ4emVFXhOw0ejMhqGi8dErAUgwuADII6pvXgVspR3lmaRdsML7EN0
	RSTzmd2YDp/gB0nN9RXDLNLkFu7sg0KQLj1loQkSPYsx3GLYd+D5BvA8RGn4RUM1S+8VTa/yT6r
	szv7JaIX37H/I
X-Received: by 2002:a05:622a:180c:b0:52d:7b1a:d7e0 with SMTP id d75a77b69052e-52fb962beccmr58823611cf.32.1787912403953;
        Fri, 28 Aug 2026 03:20:03 -0700 (PDT)
X-Received: by 2002:a05:622a:180c:b0:52d:7b1a:d7e0 with SMTP id d75a77b69052e-52fb962beccmr58823041cf.32.1787912403346;
        Fri, 28 Aug 2026 03:20:03 -0700 (PDT)
Received: from oss.qualcomm.com ([86.121.170.13])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49b4e2c1af7sm121136015e9.15.2026.08.28.03.20.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 28 Aug 2026 03:20:02 -0700 (PDT)
Date: Fri, 28 Aug 2026 13:20:00 +0300
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] arm64: dts: qcom: sdm845-oneplus: Drop redundant
 status=okay
Message-ID: <2v5dve7o7a3alf4nj3ls2q2zda32i6ncjd4ykebzenf43failj@ox3fpiaf6aky>
References: <20260827215001.34184-2-krzysztof.kozlowski@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260827215001.34184-2-krzysztof.kozlowski@oss.qualcomm.com>
X-Proofpoint-GUID: vYlffJ9Xk7URGxfEFJtkY_AMn_8dcLv7
X-Proofpoint-Spam-Info: AW1haW4tMjYwODI4MDA4OCBTYWx0ZWRfX4sRyTBD3uzH9
 UcthryA7gOFCRzUwWkwyNmGz9kVvh2sQUqZsg/GN3TPnlyCUWB0cxvxvsqC7baJm3LR6m/m4F3r
 Puanu89goq+8dkug6xO5/moiHqZyfXA=
X-Authority-Analysis: v=2.4 cv=KPpqylFo c=1 sm=1 tr=0 ts=6a9160d5 cx=c_pps
 a=UgVkIMxJMSkC9lv97toC5g==:117 a=clBUptZa5v5FR042Ey+sjA==:17
 a=kj9zAlcOel0A:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=ZOeRlPTctedjAYETTS4A:9 a=CjuIK1q_8ugA:10
 a=1HOtulTD9v-eNWfpl4qZ:22
X-Proofpoint-ORIG-GUID: vYlffJ9Xk7URGxfEFJtkY_AMn_8dcLv7
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODI4MDA4OCBTYWx0ZWRfX7EFwbiVhv4D/
 WNzifIifIEtmwUlqOd8nMNhDysf6z4InCdfRXvTOf8r+0Z5zYIsFn+Hk8tT/cRiC6NhAcuG+s0N
 DV0ZJkY4WDwp8t9YyCFSgKMwjrDnlUmN9B+FcWbA8KhPvatMyIoF3zB3e0a9xJgnikdCUrMSE87
 wqKP1EtbXgtBVeUA35535lmhs1hXDFVKvLP5cvWr3iQgFHrfEE+VAbcc3HGolZqPBfj/AkDiArV
 vI3OakCTiv7fWkknPT0wpQ/VmgQj/Cb2qEauVwTLrEvUTy1RNzsDsML1zdSDmbWiU2xVi3IiBxZ
 4OtB0s5N0yN2tHQnPLexatKPr35pJRVuhFt3ifwO0P8X2GSAYr/LsZGdXqEHjaQoDL5PdJdIo6C
 WlkZizCSOwcxqsPHh7iWpwPIjWaQgMZjVLa4sktTRyIdiyX0Su1JcXlTTln87EgaA1YYruMjR5w
 aH77yueF0aN5P5+nTsw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-28_03,2026-08-27_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 priorityscore=1501 suspectscore=0 clxscore=1015
 impostorscore=0 lowpriorityscore=0 spamscore=0 adultscore=0 bulkscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2608280088

On 26-08-27 23:50:02, Krzysztof Kozlowski wrote:
> New nodes does not need to set the status as "okay", so drop one from
> fuel gauge.
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
