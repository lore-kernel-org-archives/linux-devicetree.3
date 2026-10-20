Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792501337;
	b=2xYgjO5tSljUzObSYxSYs4gSRC9Csm2WYckHbsDK3KUOeCZuiVCD0Fa3xdDGcAKmkZpQ
	 M0Y7ydQWADaRgTjn2QHj9Y4PT3b5xDIcyDgf3+9khRDVVMp0+Et04wd35qi6nwNZj64ay
	 OIs2E6RK8j9euUJ6V/EzBMA0RSjTSFsi1j5KXJ1jUgbaFdztN+JheNqUK2mLOlFJTIltj
	 D2PbU+Mfxd6Iu9Mu3OBkW1Czjr6wJFu7OV+OBX4MoOyZuVuxOg34ahlWYOwvnAl++Nxr+
	 lU9yszsqvkMU3QQqi4Kab2PLPwdt9xEZRfjZ5BsUnMaDw8KOqILXw4YaPBWILvwbv5g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792501337;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Date:From:
	 To:Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To:X-Proofpoint-GUID:
	 X-Proofpoint-ORIG-GUID:X-Authority-Analysis:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=E9+isAu1JUaOE8ta5xXFojt04qILV/+xKrOOocJ3ry4=;
	b=X1R2YnSdbPCNzZ9W2tw5YWLyt1H+kOgY+H46VKg5vd4jCBOYoNHpQ/XG5o0utIvPAjKb
	 xFYpzYMwmuk8ZdURD7/0g6dTORxVuqex4yWCtz3lUe+gGVITBy5RFHWWReNOxE8eJGnaH
	 JODnxN0QRwYNxrhg4zonRQKVq2L3hiDknnDSdU17M6bDKHKO0nc2qBAE7lU38dNdRG1Ns
	 NSyDBwqrlkzPbG12kM5uCtAR3u9wSTpzkfKojizeiM/1m2s9PGyykmmmaWS0rPDGm5HYJ
	 gTicemn27FAipXJ3ONFiA1Dmd8noNBlW4A8UOoJY8VZ3hmj/kMowP+Fx9N9F+n3Ga6w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Myij8ayj;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=ZeA81JMX;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F37B4606A324
	for <devicetree@vger.kernel.org>; Tue, 20 Oct 2026 13:02:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org F37B4606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Myij8ayj;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=ZeA81JMX
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69KBWVZ71571787
	for <devicetree@vger.kernel.org>; Tue, 20 Oct 2026 13:02:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=E9+isAu1JUaOE8ta5xXFojt0
	4qILV/+xKrOOocJ3ry4=; b=Myij8ayjac/6exWWxw46Sl9cnKLQku9yE5/PRtLy
	al4LpuZucmwHA1anuwyfVkGZaVjBFA8zz1PzXqbsKlxGSiPNa2a0Ow0Bs3QkRox1
	tE+S3d0TtvGHTkVSfSVVKs+5xlBb6cIdRsEAKwsJRSHFNNkF4i0NCMUdSfEMi6Uz
	/4TzF+Hp9KahFPH92mcXbqQW4yDVq8pcyuvnhXfnWi1IffWkoeBbJPkRpsJQ0oNU
	k+fEFjb/oYxdin1jmH81hZXPvrAMNtD4e9i9mKbVvhUndgYSy21UrzxkIcfLcI8S
	klOy1q1vGwQ0H0f/LHRfxJWvSsBVX1q1Lt2VL+rMdHYhjA==
Received: from mail-vk1-f200.google.com (mail-vk1-f200.google.com [209.85.221.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4he7h289e8-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 20 Oct 2026 13:02:15 +0000 (GMT)
Received: by mail-vk1-f200.google.com with SMTP id 71dfb90a1353d-5ead18311ebso367143e0c.3
        for <devicetree@vger.kernel.org>; Tue, 20 Oct 2026 06:02:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792501335; x=1793106135; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=E9+isAu1JUaOE8ta5xXFojt04qILV/+xKrOOocJ3ry4=;
        b=ZeA81JMXfFBJCIJNKiBUMkJ/T88B+giGRg6DVIaA92gvpnTZcmfMss6/DXCOd3ALPN
         +v7BZS2iIwtgpqKs9iBpJxEZuKcQTGTUKstyvTdlM3PORGTW/LxdikhxZtibeDvndlLI
         LggNJ/sFhTeF+O5OJU3yuxnzehNzeGwFvxJ810DjzRrmuP7/5w2Hn3CxXRx3AtruSz5U
         RHGrfS1+13LlQu3O6HWCalqZLEL+1lfSaGzun+mo7LmkzYTwGsKQmfQ+ifqrWtnL/7qB
         7nT5jekIPrl3kq3OZLG5vXv0TTRoMgJGgQyiADGe6gSKdbNurvohx4gbdubJonwDwXMU
         XV6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792501335; x=1793106135;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=E9+isAu1JUaOE8ta5xXFojt04qILV/+xKrOOocJ3ry4=;
        b=23dvvOPk62Qj/zmVYDfoM6SUK0ah5VCAYlc9knx8FyKnLMNcDLNo6EqXSGiT2aQx5C
         KW9muwbvqbtrbiJnQ2VeeJs90EbgQ7J+fzkg7kC+uepxMKJhBXjrWhiGX94c7ZHb/VGF
         JpxRgQSUuorHa8bUq4X70ZFnI5IeZYfkpE6zVxRgvUxN45zuHLm8ciu5liDUtlgt5SuZ
         xEhA1Zr0JwYE8/sbQYxHGt11Y2sZH6nn2csR/bqKIe/5H1Gop33HGl37DiPcBzfipjHP
         kCKrx2RjBlhV4SwaDFRPH2FBZOZ8rQo6klO2zPDxQ1JhHsC7Y0gUTmfDQwiyqCDIPCp/
         iI5A==
X-Forwarded-Encrypted: i=1; AKwUvBzSeDB5ZiVrIodHThJg7AaI6obWumbrS2Yndav61xslapXg861881f9c62eqQxxlBmHSJwEXuNDrTsc@vger.kernel.org
X-Gm-Message-State: AFq9FYK4BZj08wH9qOK625jNQtcEiP6Q9H/wEopNwQsX4wYyzE7AhSl+
	XsUl4r5xzlBqjPTYNUNqWzjdAQ3Gn+nxj6yHnaTRMmAXltgWyVviCNDZHHWsbEK7RF+nf0qY/2v
	3Y3/1SWV0KmRlosDPtRTq/r2+bVLxSCaon0h7fqJzLzTUtEC6GVQUSSRjLORlgFYr
X-Gm-Gg: AYBFou3CprQed5+oyD/kqXAV2EqoJb6IMdw+v91xFg5bZLjfeAkA+A1cij11yGI5Til
	NPe8gPpnN36Tkl7Vhmn/9TIHO6dZLLVN3rISE3+5ZkgTam9Eg91KaarkYtpTblEYgf0pRBY0sh9
	TO3NAJIbnc3bO5+mRoWdLOUe1IvmAqq0Es7hcs7K2dAGcm2Gejlzo1eiMbdWxnBXihZuWjAfCqM
	EjKClLI0CFazFFzxBClYhPe8my8OJlyWCZnOB+1n9XjhSn/jp0pMCVBPeZjQ+AqB0yBTUXvY0HL
	X2Js7V/9dC/VOPQYwvDfjaniBl8R7fujUSQ2jM7ccZAsmBjge4OcXIC8Hfjt8y08jtmUOGl/l6W
	9FMqAyAOhk0Y4aczE
X-Received: by 2002:a05:6122:2225:b0:5ea:bbd9:e33a with SMTP id 71dfb90a1353d-5eabbd9e95amr2468870e0c.11.1792501334681;
        Tue, 20 Oct 2026 06:02:14 -0700 (PDT)
X-Received: by 2002:a05:6122:2225:b0:5ea:bbd9:e33a with SMTP id 71dfb90a1353d-5eabbd9e95amr2468571e0c.11.1792501332538;
        Tue, 20 Oct 2026 06:02:12 -0700 (PDT)
Received: from oss.qualcomm.com ([188.27.161.187])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e1d80fdbbsm6393833f8f.17.2026.10.20.06.02.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Oct 2026 06:02:11 -0700 (PDT)
Date: Tue, 20 Oct 2026 16:02:10 +0300
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Igor Belwon <igor.belwon@mentallysanemainliners.org>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 2/2] arm64: dts: qcom: Add support for Xiaomi 17 Ultra
 phones
Message-ID: <xg74bfkwbpdqvo6roqpnufcffeidgghtnenghmvmyq5ugd4i23@oyl27c746qre>
References: <20261019-nezha-v4-0-19c1e31eb255@mentallysanemainliners.org>
 <20261019-nezha-v4-2-19c1e31eb255@mentallysanemainliners.org>
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
In-Reply-To: <20261019-nezha-v4-2-19c1e31eb255@mentallysanemainliners.org>
X-Proofpoint-GUID: GTSx-dAXnNtiasql0xA_Ktja_iHxLUfy
X-Proofpoint-ORIG-GUID: GTSx-dAXnNtiasql0xA_Ktja_iHxLUfy
X-Authority-Analysis: v=2.4 cv=EuJHPicA c=1 sm=1 tr=0 ts=6ad76657 cx=c_pps
 a=wuOIiItHwq1biOnFUQQHKA==:117 a=Qvngrl3H0rQgGg+94q4QgA==:17
 a=kj9zAlcOel0A:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=4I5MClDQAAAA:8 a=EUspDBNiAAAA:8 a=qo6UdcItuGezONPPF9wA:9 a=CjuIK1q_8ugA:10
 a=XD7yVLdPMpWraOa8Un9W:22 a=1V3rjZ7Gd4_ILS_TCx9Q:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIwMDA1MSBTYWx0ZWRfX1m1gdNYQuj0X
 eH/WatLbk5dcrJwuZOHkCQFuc5YEQk4khtc0rYjhV647X2xa2apdibrp1Qs0pSB975BLZnZt5Ex
 pc12kLZMFFSvVDzzr5lbzYZESkUT5js=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIwMDA1MSBTYWx0ZWRfX09nqGe8meTqC
 hIE5KX6sBiBZlEsoC1vB+0YMj4Pfy7TB+tJBBEnlhQQGXNl+7WrnaAVGlHekdakeQhvgV08MChH
 qgrYDzFv1Z+7Z1cFqVYHW5SFaizaP+5wHh6QVxUbXH8GUw04yoR6rNVM8O6i6qYilV8wRYlcA7u
 Gg6sT927Z1X/iOFq9FzVg4w5bM4sIlBxtPDbugGIt+SlNJfZwOPyK5Q7qYH8tsls0BD2rX9BPpR
 fE8VH0jJoDiHJ/Zi8amqe7MFa6grEXVVzECY0423cGQu7YXHZiYFPfG3nZoDbQ9HbjtaU45dkFF
 reRclSHtRA3RoNDjBjfN5gd4jY7rLMNwO7JIi2SXtQ82QUtk/m7YEKJcTVXAcktngLyyThRNtSD
 Bbq73FXOf803OzHSdzK9xOPBsv4LTN0BxPy2LILuEU/tBZPiTdTtAiPtJkcJ4jVkgu/8Q+1YHqK
 RPyuYs604uwl8HULriw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-20_01,2026-10-19_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 impostorscore=0 clxscore=1015 spamscore=0 adultscore=0
 priorityscore=1501 lowpriorityscore=0 suspectscore=0 phishscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610200051

On 26-10-19 17:47:23, Igor Belwon wrote:
> The Xiaomi 17 Ultra device, codenamed 'nezha', is a flagship mobile
> phone released by Xiaomi in 2025 (China)/2026 (EEA). It uses the
> Qualcomm Kaanapali SoC.
> 
> This device's configuration is based on the 'MTP' from Qualcomm,
> as is also referenced in the downstream sources. Apart from the
> usual differences (i.e. codecs, panel), it also uses the newer
> WCN7860 (peach) connectivity chip, which is why WiFi/BT are not
> brought up.
> 
> The difference between the EEA and the Chinese model is the battery
> capacity, notably, the EEA model has a smaller 6000 mAh battery when
> compared to the CN 6800 mAh SiC battery.
> 
> Currently implemented features are:
>  - Booting
>  - Power and volume keys
>  - Storage (UFS)
>  - USB-C Peripheral and Host modes
>  - GPU
>  - Fuel gauge
>  - ADSP, CDSP, SoCCP remote processors
> 
> Signed-off-by: Igor Belwon <igor.belwon@mentallysanemainliners.org>

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
