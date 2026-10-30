Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793349414;
	b=ITfPcBot2Fdt6qM+s5GwId7GU6yu0UwujfwJI/CiDxk1gJGmQj+XfPisd+pvbKg4AF86
	 MkyWb2aVc3VzaSj4UrJUoQDyjGUzCPMeyM1aKVgnGeTF/YwjsxMCZEaB51z4BMEke22rh
	 217oECGSSferyEzzz1K1xvl8flcmNClyGeZ2YR9rBPUecp3ADEiQGdjIfCI6JSUANETOx
	 psAiOeiqdcjjkIbwiN0NN55OkA+h3heEHsYqYPxWdYYMD6E2Jd3X2t5meDfLZLwQPVOWU
	 mpzjwB9eAVINvIPG277ztV9s9+K2el6qrVd4pbJ8oRVTd6FResNHDf3vBEYsyhH/jrA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793349414;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Info:X-Authority-Analysis:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-GUID:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=GFKAX4ESfiQcX34DEO8/H5iweYY7L6Uhahq73cphBfo=;
	b=q/nHWGx2W8qAh8Hee1x38YlYhNddbQPjmaMUu2xSkhuAXp7wAbkeZn8FMJD7nX+NPcJO
	 haoWXtn5JeZFX0YcTAAp8NbuRvt3hA+oYGLJs0iW1tms8UpEIDVewfx+8H0gW7xoE+174
	 jk8dRbk4wmYatEeH9lmXfMsXzevCO8DxvFoUx4aW5sBsu2jm63edAoMtIrCOp0HX1RrWV
	 eeBkaQhm7tkqJap0gIRkdNoerhk5sAR+M6CIKautPSmGcJ+p0cVB43KAO3btnq5W7Ic+R
	 Q0N0L7vRHhZZW4kNmDpiCvuEN5+wgxCFTuDQ+bRuq6DU8WlRP8GzS3+o2fgjA0Hpgug==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Npb0xvIQ;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b="gOW/DsAI";
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4A1F2606A326
	for <devicetree@vger.kernel.org>; Fri, 30 Oct 2026 08:36:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4A1F2606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Npb0xvIQ;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=gOW/DsAI
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69U8FMqL3709723
	for <devicetree@vger.kernel.org>; Fri, 30 Oct 2026 08:36:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	GFKAX4ESfiQcX34DEO8/H5iweYY7L6Uhahq73cphBfo=; b=Npb0xvIQGSRA+aPx
	7LKYgO9RBr8RkHvzdUIRK2LpgaiITULMMgOV2LMuvv7qbfVCc30kjRtkjViuKqth
	z5c7JU1d085ob43F348Bmix1gmiKoGwuGtK/cbl19KMskJEpVX4zIyO7KpRmRM0/
	mtz4zJdb8l088IZNKDpDoQdpXa0Cn2jtLromPMD6x5KiTJT1ZfybLI9Ncnnyhdr5
	0p+02ySBkrd+Z1xpOqO9b30XhtBb8lHF+KUbxdhLTZ7JgptGd/7NbMup0ycCb2Gv
	umRrktlFaXGFEqjwurdMZXUmn5BTFh/jMR9LeL4CL2lPhayQp3Aq3egA9Ya9zLFY
	EfR2Qg==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hme6rj3dq-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 30 Oct 2026 08:36:53 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-93f1f1f2ecfso9945685a.3
        for <devicetree@vger.kernel.org>; Fri, 30 Oct 2026 01:36:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793349412; x=1793954212; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=GFKAX4ESfiQcX34DEO8/H5iweYY7L6Uhahq73cphBfo=;
        b=gOW/DsAIAbyCTIKZIFziFB/BIapdQKDqgskODuTvnwguScmG26BlZat5zn2Zcja06I
         OJYjiC3CcepFFdh8RitUrOw5od5YtQu5pxM7tiTMfBoNGoWjNVLZ47cdeMrpX1NB+r1z
         kveF218CYZkNTVBkS99v3kH4tIaPqg8+KULR1brDGLL8KF0qBFhccbdl/G6PDGVtL4q9
         O43cu3uYh2oxXckte3589o58m2nAemNkz0IWwWmYRxV4BljboUuu+KCfNRmnoSayL3uY
         +FER+69KmaCKaJpoQ5As/whkQYwx4oYmlRJkXAvleM3qpXwn74/2fdwNSgPqglZy1W9d
         UPVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793349412; x=1793954212;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=GFKAX4ESfiQcX34DEO8/H5iweYY7L6Uhahq73cphBfo=;
        b=s4vjys3bKfOLXtUIR0T5BPguvk5kWKeV/VOLn00Iwhb4Fy7292WOWXSQIyXUsTPd43
         aix3wLLA25zagMGOn94NjaeFjzlMUUXjrt6gO5k/V5GEEVeF0SU+1Rs5j3kalMACrm0L
         Bf8kGUzkZ1GanrupGo+hv9tfGzjJamkJ+lOfO7QIP00e8Bd/EjSzq2whe0OUi+T6DjGj
         9wmVZvK37oN9T7UXXhmbCu5JRfr7v0tWC7UbSFic64KAELkl3WNwtEJeYyGsJ3NY4r7j
         fMkFEUst/3xNyl2zo9uGt7bKu2ipE7n0y7BDwaMFfoIt6SRfPxpjjfGlSWixVrLf9eVn
         g+WA==
X-Forwarded-Encrypted: i=1; AKwUvBxsR8GdOoxNcmzRX0YXxoNFiPmbWIIh21uLE3ljhxXSg1kvAVxV8O48hG+91xF+6OukmJWqHNtA+vSj@vger.kernel.org
X-Gm-Message-State: AFq9FYLz7HEfMpxhDYtD+al49AwfX+YVNc1jm0U2SCLxawi07BVXnaP8
	kM2I6BlfUtHZS/EePdYrFGn8wL7/T9dqCfFnXQJqvE7sbDWROLFTjTkZwPrDuVf+b0IJpuhNQ9i
	Kzp/7qFx+4f4SIjoDYQdcJ5mKes7/3/gu20BAa6KFI4FK7K2VMpLdOi3dsnKBuC3l
X-Gm-Gg: AYBFou2+PhJOGY6kx78rWrUI+a+Jkb5eVApAl8EVIbqVXgbA+ihXTjm+KnEh7X5QOu3
	qQ5fnjKCNCIk0wffqTmdtmNKd77ZQUVEpRRGdyGOx6YOnxnvAsJTETxZJ5Mlr730/fExXS+TzQF
	1/F5I8TXK44/P6ee2LDqQBfoWkMs+22JkeRv6fyApL4ZSJE9Ucaq+q/upba7uzs1LhixfFU8WQ6
	ZaT3D5kOIOC/Pa2o6b73cqBvfZ7oQPoghsfGtHur/8BMsmsYstu4qqYTjRRtL/+OMeYAQDVNled
	xRaznd/z0An3bYNdHR+EJZwpSVI099A9MpfcBK69XXh/iSxqoNWCOc+EoFpZgz5rt6kgDbBt64v
	luPjQNgpfiJok7yDjwMAvbR5t/4YRoRz+cDyM+DG90UD1YIFUK4Usnym8hag1GZarkQhj4zY=
X-Received: by 2002:a05:620a:72cf:10b0:93e:e111:2771 with SMTP id af79cd13be357-94421619197mr267092285a.2.1793349412586;
        Fri, 30 Oct 2026 01:36:52 -0700 (PDT)
X-Received: by 2002:a05:620a:72cf:10b0:93e:e111:2771 with SMTP id af79cd13be357-94421619197mr267088385a.2.1793349411659;
        Fri, 30 Oct 2026 01:36:51 -0700 (PDT)
Received: from [192.168.226.64] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6b4d7b42653sm381344a12.34.2026.10.30.01.36.48
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 30 Oct 2026 01:36:49 -0700 (PDT)
Message-ID: <7c8d7b8a-c2d3-4215-9c82-6083648c1da2@oss.qualcomm.com>
Date: Fri, 30 Oct 2026 09:36:47 +0100
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 4/6] arm64: dts: qcom: qdu1000: Mark USB controller as DMA
 coherent
To: Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20261030-usb-dma-coherent-v1-0-3147b8f7aa64@oss.qualcomm.com>
 <20261030-usb-dma-coherent-v1-4-3147b8f7aa64@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20261030-usb-dma-coherent-v1-4-3147b8f7aa64@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: KFmEAmoh1sNkedtWIvFoZFX4OnCLXpb2
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDMwMDAzNCBTYWx0ZWRfX6svcsb5HBMdx
 0T7kZOxxY4VXjzBLfHdzZHgtr5cQxQK2B26KIeVGx4q8sGF+0R7cpXQK3CIESuHoIi+cdXcBOGJ
 7GoKlZYPoJQrYHZ3PsFbXWbY+GCcq9I=
X-Authority-Analysis: v=2.4 cv=PIqaavqC c=1 sm=1 tr=0 ts=6ae45725 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=r65pQlftkxrEpSp02AcA:9 a=QEXdDO2ut3YA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDMwMDAzNCBTYWx0ZWRfX6WNozwhGCs87
 3OlomVPXeQN1hkGlPrdGoYa3WJ5xE3WoRLHnzyYslyRKGYNVPEElSNQR36uSZwfF3qBHgl3oGZd
 ZSXVuLyRUZk68E6wgI8MSUj+96Y/vkUjYSkJJ/sFH2l8MV/5Ez3jdHFwn3C20Y2trDSswAS/+Zl
 5T0ZZqoo+WR5kRZYjCNmyzGS/DmcjFQto/8TVphFZ51ei+GwJ4B8BAPhrEpJaxDAIdLZoQZ52LD
 FjH5cFPK+Ej60g6sa3+re83tqzRc0upMyPyme9mAj+5JtNs9zr3qAfXK4CVkUobY3WDFIS7uFb9
 V1Ps0O3Tk325FVdAi4yNqy+gYYuCcFtCpZNRg6ocdn7uvJ9pqIop+s8jXpmLS+cApRy+IxkvhRV
 Xz2Qg+1NXsat5qCqTJ29kQx85FgFdTPmOH8vZgC+LKTCNneYPcs3vCyuFAPIQKxiTW2PDtcHMbd
 S9K0z4Hyyhp3OX7wkCw==
X-Proofpoint-GUID: KFmEAmoh1sNkedtWIvFoZFX4OnCLXpb2
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-30_03,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 malwarescore=0 bulkscore=0 impostorscore=0 spamscore=0
 lowpriorityscore=0 suspectscore=0 phishscore=0 adultscore=0
 priorityscore=1501 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610190000
 definitions=main-2610300034

On 10/29/26 7:33 PM, Krishna Kurapati wrote:
> The USB controller on QDU1000 is DMA coherent. Add property
> indicating the same.
> 
> Signed-off-by: Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
