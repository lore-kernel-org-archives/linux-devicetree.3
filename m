Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793201381;
	b=yw0XhYNKEJgGJyC7N8NLBIt0ajkH4wBo4ArWaBC+1p1cFp335/DtnlrR74LDq+tx1VpP
	 MUgH/vydqoOxty0+5czfnpUW2qmC2GpfscWiUq4dau7mE9QN7ohSxL0aWaKSOmvlmZQDd
	 Z5OKBbsi2ybG/Gg0Tv1Quj6xNiG67uS8IggkzhtLuldXyqtUk1MoY1iX4JoWox/EGd6yH
	 ifcEGRl+MBlzATjtbcX6QppyK+Rh0/SYyXPMD9i55vg/tbu0fi86akAN8uF51QQ9Cj511
	 HlAn/OADQO1+sKU1/N5R+XsqrV1k6alCT15Vlk7eExAhE8j3jyRjRxPZcyf7bTorjNQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793201381;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Date:From:
	 To:Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Info:X-Authority-Analysis:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=iQrl8WknYAEfdiOkOet54umzUF0swLaPr/vomAPeW8U=;
	b=dj9R/QMU4AdzzfttwzxQZSk19c11FRq0yov7etOqCRwcTjtbYP7DfgroxktnHFT43Cbb
	 948GrGdvnBmuuYBJkXZI6mWewnyuXqoVDA3IKAXUkOdyIav7cGpol1d5s37psinexbFX/
	 4bzGUkolgpxVmYnF/xJnOohqhb+du83A5gq6o7gysl8eT4nLgUQdYUQWNR40lLkwmrNRT
	 WXWCELV6jhj/W4I5F9/TUSYaurRKJ2J0n+7spypSC9gcsz+BJjob5lm+DBl6+UfTGWyFu
	 H422MUbDGFhoUNlgNlDd95ZZ00Z/iQIgbGu+cy21VoL+Do+AoUP3A+PtvSq4UR8nxxA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=gDLvL3Vz;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=PzOzSm4z;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 83B9F606A31A
	for <devicetree@vger.kernel.org>; Wed, 28 Oct 2026 15:29:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 83B9F606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=gDLvL3Vz;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=PzOzSm4z
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69SFAPHb2544064
	for <devicetree@vger.kernel.org>; Wed, 28 Oct 2026 15:29:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=iQrl8WknYAEfdiOkOet54umz
	UF0swLaPr/vomAPeW8U=; b=gDLvL3VzhU5Bp5i7n7BerrWt7HmdtMRSMLDxihoA
	TT6qp7GW1PWTHZef3cBSY0Z4eqcJ+t2gSfqS9mXCG2ckezUJnBDiq9jyXD2bfyIz
	8PRSq8dFkSNcktui6PoAs6YH+55J6BFZzSEYKNqRe5JvEnKzQxHpLzYfyNIhyhXE
	TYNNnVvbn22KxAnjZ9l/EdNuzyMj8tix5hVi5aM9TKZd1dMp2BQS7+8129xAN/Ah
	G/6o17oOEq+PQQLyz45NxcgdyMXr09p2NGMVeW4rcSYeo5LX4zjogvcn+huo6B3d
	5/UH2Wj+ARLhCQmA13p+AoiUWJ+hy9aahD1PiG37Q9PYsQ==
Received: from mail-vs1-f70.google.com (mail-vs1-f70.google.com [209.85.217.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hkkehr3aa-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 28 Oct 2026 15:29:40 +0000 (GMT)
Received: by mail-vs1-f70.google.com with SMTP id ada2fe7eead31-7b206156cc6so27726137.1
        for <devicetree@vger.kernel.org>; Wed, 28 Oct 2026 08:29:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793201380; x=1793806180; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=iQrl8WknYAEfdiOkOet54umzUF0swLaPr/vomAPeW8U=;
        b=PzOzSm4zirVaMUoRZn9LPhXWBzaxk8JIbbRTGFFDfnLyohbulCN/vFt7sTUQJFie4k
         NtedxWAwaJL7S+NRdC+aDf9ZUiio4uzN9LVMZjcTiZiGImlsvi39EROvIWFKcROuQ6zE
         1HKaXyaaOWpfRiWZmf3j116YgAzwC108KjQ519srF4pYDfl/ah+1T5V7uHPd4/WhDTET
         Kz3GOWIw5LVeFJgtRQKp+Ljy6WRE9GbtHgp/Z4ZZ8IoOmyaRk8jqVi7mSlp+EjwoSFBH
         nSQa3ib0staDSBmy3uE1xLVyK9LtLnhFeFKa+FU7QOrUrHGXThUmU2s0gUxYUsBI31ub
         H++Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793201380; x=1793806180;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=iQrl8WknYAEfdiOkOet54umzUF0swLaPr/vomAPeW8U=;
        b=1DBN9MhNgJSfMiG57UUSQyua4QK0Yp/Xf4GWcDl0wxAvuoW2vaGYCxO0tu4ePqQH5S
         4pw3HfW7PIxoB0FYsIGpcRBE07yJpMnSxcSSdGZsEyJJ2VKPCJ0eb+nnr+fDGLwaZUMU
         Fs29++cRR4Ru1qxNLBhfpa7Fb0tUGX3PfymQTJtP0O6v/iAVOq9iKxbcH0qgKTlb/tL/
         QUFJd9YSlWdTXR7XzjI0/r4GlvhI3zkaU/AQ+up9Bj9iWUR3iTJXJ3pSTpJpniZMS0kR
         Y3w5tWhHRXXtGLBWqXIIGHZtqrfp426+DeqKDE/QVv/ikW3H2jvHOwD3VV3iAMSymTtq
         0paQ==
X-Forwarded-Encrypted: i=1; AKwUvBzXXemo0yrMuIEMdfCn9Qemrl3IryMxMcsTHMHFIxJot8cAWMMQ6JCrXcRPDDdSLliGq4gL4AtH4jvv@vger.kernel.org
X-Gm-Message-State: AFq9FYKnsTyKhTxU/gDBStWnZAITTmunYWOO5UZX50fyS1ap6rYxyfnf
	WHQnunF80VmYmG3O7xv065UyThtsQ8FHPki9qDafFMwV9qT8hz/0Gtj8tPYE27Z9OaAfjolyQiK
	QhStS/1mszFw74TMvqQGudlkE1AV9Ryqi42897QWgM709adg4Pzr3YoaxY/DPewse
X-Gm-Gg: AYBFou1non/b2U9FB+Nry5Ad6OxtPjs3TGu3akNu9RlRf9l2TLZGipnhSIXEIW/4zZe
	4NZm8Mmp+4VM2YSErHHQqc1u8+DhUeSBVwZZBn4xsDhxSOs4nNMtObLMt+yMe7IQbk+4W1+tsHF
	cbOA/+v2Mq99CeXdnEEQ//t/nNE5KCNvlkBoLDn6QYmGl4fSbYlRoyWMa5J8WWzxEfxj/PF4PuP
	WZ3dr8/r6B3q4FIou16++R10JdzNThz7jGqyNKfKneHdrGJI/oHGnhfu9wr/+yD3mtBt6BKvmCU
	9hKje4KVQUA+LkpNANnQhT8WwHnZMEq2o+TM0zos8gxryAnMVh8aUyXTw58cTFD1jeOqeTuwurL
	CX/n1R4MYNPnGFLU+I4hDheMdT62kmI5JJx/vxiDrBL64Ak/722CodLcjjbf1XuFjBg==
X-Received: by 2002:a05:6102:4b13:b0:7af:fef2:8ecf with SMTP id ada2fe7eead31-7d03a434b91mr1474828137.8.1793201379804;
        Wed, 28 Oct 2026 08:29:39 -0700 (PDT)
X-Received: by 2002:a05:6102:4b13:b0:7af:fef2:8ecf with SMTP id ada2fe7eead31-7d03a434b91mr1474799137.8.1793201379230;
        Wed, 28 Oct 2026 08:29:39 -0700 (PDT)
Received: from oss.qualcomm.com ([188.27.161.187])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a92de010bcsm50884345e9.0.2026.10.28.08.29.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Oct 2026 08:29:38 -0700 (PDT)
Date: Wed, 28 Oct 2026 17:29:36 +0200
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>
Cc: Bryan O'Donoghue <bod@kernel.org>, Vinod Koul <vkoul@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Manivannan Sadhasivam <mani@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, linux-phy@lists.infradead.org,
        linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        jeyaprakash.soundrapandian@oss.qualcomm.com,
        Vijay Kumar Tumati <vijay.tumati@oss.qualcomm.com>
Subject: Re: [PATCH v23 15/15] arm64: dts: qcom: kaanapali-mtp-camera-s5kjn5:
 Add DT overlay
Message-ID: <s42v57ohmpj55nsmfiae7ornwkh3wtxx6c6gc2c4nd4rlw32xm@xhyhyni73g63>
References: <20261028-kaanapali-camss-v23-0-95f250b18612@oss.qualcomm.com>
 <20261028-kaanapali-camss-v23-15-95f250b18612@oss.qualcomm.com>
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261028-kaanapali-camss-v23-15-95f250b18612@oss.qualcomm.com>
X-Proofpoint-ORIG-GUID: ek-x8YtY020FzBs92wek_iViz8ltsIf-
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI4MDA2MSBTYWx0ZWRfX/BxKNtWKWR1S
 qqqVoPpO6uPWlxgSI0a2QtPE6nYlLzAAcYsQ3HnG+Um0PpQCtkqgnBjbHGvuvN5kPYmobuj/yWO
 KzVocLuz5tTZ4zKlK89aH6rsbtXXWEC0+Ong/291xwze82n54KP2JkvN1Kkli/Xaj1+1Z4nrDc1
 ULnohn4aO5/3+12Ymab86x/zJCQ300uiOntsuLlJ4WxKTHgpwP8FYJUuGMyc8wMQ/agHPASEfff
 gYA8RbT4yieKfuc/3K2rkjOgxb3qi71E1w0m2UN7tS/AZO2xrlN3RWaHslUCjiYstqtLoPMd7FP
 vBEkHfh6ablqpAWaHwBxVVl0STv88Za398H5GTGt+mmp2MZUVFO7M4yAxN0/4w3R/uCaQll6HYt
 b0V5iWqD7+8rIF5bO5zzgYvwJSjFLkGakWyZYkwDIT/ZVmYAH1fblFpiVPdgK+wFC0sKVFn/1tI
 FZUhOcmSx4Wpvlh+ZBQ==
X-Proofpoint-GUID: ek-x8YtY020FzBs92wek_iViz8ltsIf-
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI4MDA2MSBTYWx0ZWRfXxqU7gToBabj+
 tuIWrAgO0pcJkn7lDqwi5MOqevdRPbmiCcrdDiIHLQ18jdVRmD0irZ8v9QiMZJlYrMGbJqaCmun
 CJuaDKYMeyf225ftvpjTJwwd5GPYXgY=
X-Authority-Analysis: v=2.4 cv=bYv+w+PB c=1 sm=1 tr=0 ts=6ae214e4 cx=c_pps
 a=N1BjEkVkxJi3uNfLdpvX3g==:117 a=Qvngrl3H0rQgGg+94q4QgA==:17
 a=kj9zAlcOel0A:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8 a=WWpD2f5wiKzpAssyet0A:9 a=CjuIK1q_8ugA:10
 a=crWF4MFLhNY0qMRaF8an:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-28_05,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 impostorscore=0 malwarescore=0 bulkscore=0 spamscore=0
 phishscore=0 lowpriorityscore=0 clxscore=1015 adultscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610280061

On 26-10-28 08:20:49, Hangxiang Ma wrote:
> Enable the S5KJN5 image sensor via CCI on Kaanapali MTP board.
> 
> The Kaanapali MTP board connect S5KJN5 with QUP I2C bus by default. This
> DTBO enables S5KJN5 on CCI-0 interface connected to the CSIPHY2 in four
> lane mode on a rework camera module.
> 
> Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
> Signed-off-by: Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
