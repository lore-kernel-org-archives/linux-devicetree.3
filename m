Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B3A2841A76F
	for <devicetree@vger.kernel.org>; Mon, 14 Sep 2026 08:58:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789376338; cv=none; b=Yw351LcsMMmHywrTLBw8uWX4+POpGRbaSeqHZlLTHYD0QjhDSmrCmxJYCF1tP+hDudk7cp2ZwnzfYkrF2jIe64296reHxrkp+HGg1yjOJehGHW1XQGk/KK1NXYyWHOY4cjggASgu7FUWT7voA8usy0sdnCadPMWalF/lPuFZBo4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789376338; c=relaxed/simple;
	bh=007UxazwKBVk6DLr4rQj/ZyfjuNlcMJacLfSlvz+yX0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=L8/DSyfdPjxCLIiqiM3zk3rig7QwohaThxBXrX11A7ALq+kYOqrA12uBiNL/cg9MjHEW6x1RV0efjzpr1vNh2UI3xvUZdeNQX6hHDYvO6XExsI+Lzj5XNXUU4xc9TDTNNbYdp9wtDzpzTl56I8BPrls/vJY8ik/A79hpkMTr7H8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Vu30TUyl; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=EQjQIqtc; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Vu30TUyl";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="EQjQIqtc"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68E8ScTO594663
	for <devicetree@vger.kernel.org>; Mon, 14 Sep 2026 08:58:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	wWYZ7msSYmlK31FCpNcPthlZHIih2I60thjD4nII2Fg=; b=Vu30TUylXcs2ApAz
	jpkrAuzfnDI01giNPNamMcYuTycPsGACZcmeAoEaH68U938aRg7P+tTJyoCzJ3Kg
	Hz7L9XJGh6gZNfZFlqwBjwB6ua7RH+d2K7ux5q4hAzFb0pnK7RmvkShCFm0HkNZ4
	vhd5qCxHBCaeGIQCKaRxdRZ/TUS0adGCNnQ8GZRiysAdrLMPVLTQmQV/2qutymXp
	9/GTDPFNdtlf/d1hRlVuU1RBuri8/HiGbzwuxC9U60XD36wE1yEWNrYhSvFhtuM5
	RnC0kI+hKebmtvkMet94c84ooaV952/X+Na1dC/Q1aqQkRpSlx7hVRm276BRIa8y
	JF/yCg==
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com [209.85.219.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gpdevr3bv-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 14 Sep 2026 08:58:48 +0000 (GMT)
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-9102fee9920so3678256d6.0
        for <devicetree@vger.kernel.org>; Mon, 14 Sep 2026 01:58:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789376328; x=1789981128; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=wWYZ7msSYmlK31FCpNcPthlZHIih2I60thjD4nII2Fg=;
        b=EQjQIqtcAE+MKCZ/4lA2xv8oPV/TdbQU6fQUYZDC+SJMKPoTV/icvV8V9u59vj843g
         O0obnarcby7A/umIqcPN5oh8dbtla3OfsMdmbeFn6T0bzo8N3PNh+hV6PdcxrTzUImeH
         UruVPol8nh0+7l/eYkjDt9qP4RwdEWzcuFKBbD4g7ntrerid/7A8aG2O5AwG7On0SvTS
         Z5OFjAxBC26p4QfuvxC8jwuJU2m7fpJphCd/BqR4ZtxYymM8GNUXMwEo+8o//7UWSsPK
         e5R6yvU0I5oAltwwDpFZSLM61/1T711ZEwEB3gr3fzAFD+bxJIDbsBjhKoDSKAQUTf82
         mulg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789376328; x=1789981128;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=wWYZ7msSYmlK31FCpNcPthlZHIih2I60thjD4nII2Fg=;
        b=IjqQ1RuONUvtvwU+U+3kDLSL0f2Qm40mdQ0/M0/iRSzshbUPXkRD0U57QbMdg1c14k
         30qHD44Y4ar8xWwxSAQDN8onosZKG1CJLDKetXhroygo1wp1jw0IpwswuezLb3qCDmK/
         qLTuaLpz24fKnxF/8ssnPN1uVR3d5MNbt1ZSvfjDh9kIoZJaMlPf8T5zqkZZGZNAq3DF
         7RjVTTTO+oh/3R7N/OpSSN0mUhepckLY9qd7JGl8wezGPfa5kSrAqEhkCUQxL6jJx9dW
         pxPot1f+C3lhh8pdNs2SBV9Jv7QF/iv62iHHRgEHa3Zy5z1ETkSncaBus3udUp/aKylj
         o+eQ==
X-Forwarded-Encrypted: i=1; AKwUvBxq4pSE9AMR2W9bq5bjIh7IaPdhnkyzcbQgUlMY9hxxkdQtMVVDspdDTJY9zs1oz6tNG5uyGF+1biWr@vger.kernel.org
X-Gm-Message-State: AFuF++m4Q+dHngz3THNiqGBfEOKhNK0KOYK0qcgTOPlrbPaF+C3ni4ad
	00LGKPpF+E5WAITcV1/ka1hpi8fY3mTI61wOZZsWmZpC3y+2BdNZDT8OP8FjmKpjx6XXR5PQ71K
	hrItXSgmtlGW7dPMG1uS7bKSDH4ypOSAyI35fypVTqaOBWm5MXEqYcZo/B0+DqMlt
X-Gm-Gg: AYBFou0yl6UvsnxjjF3ny3MgpZ2m7O3Nt3TyWKFwVnhRQMkIREXyWEp3UrRc/3VNasB
	1IK1vkhk4jNhqINY2eC0VdEGJvXObvXtlsNr6ySqRscWYwAbic7IjyCvv6b9/nDseNTzSqEKGHb
	LGOmY+EayJDu3L9E2mNfItie8L5RNgbiCmW2Knlen2zmTnxX2WEbwwC2QemQBhQGUDH4vHUC6ht
	7+vEtUI29PHQc5/45QO05GaJHrpryUI41nlOP1wjNyM9hnsbnkuTM7C+URBtGgpv73o4wNXJsUJ
	lkm0jtHXRWJ4QsWu5wvMkKSYyobREb23eJpP0HBzxVXoH7UAqrS5SerUSUeENHMGxF00e+dHPNG
	EEXtFJnl1PafHfw3qeICgQw==
X-Received: by 2002:a05:6214:2c09:b0:90c:e7f4:8bfe with SMTP id 6a1803df08f44-9122e4f6497mr21528396d6.2.1789376327878;
        Mon, 14 Sep 2026 01:58:47 -0700 (PDT)
X-Received: by 2002:a05:6214:2c09:b0:90c:e7f4:8bfe with SMTP id 6a1803df08f44-9122e4f6497mr21528266d6.2.1789376327545;
        Mon, 14 Sep 2026 01:58:47 -0700 (PDT)
Received: from [192.168.202.12] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c29660219ecsm391189266b.16.2026.09.14.01.58.44
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 14 Sep 2026 01:58:46 -0700 (PDT)
Message-ID: <583a10f4-a1ac-4539-8e80-1bf197bfaa63@oss.qualcomm.com>
Date: Mon, 14 Sep 2026 10:58:43 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v15 5/6] arm64: dts: qcom: Add device tree for Nord Ride
 board
To: Shawn Guo <shengchao.guo@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>
Cc: Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Deepti Jaggi <deepti.jaggi@oss.qualcomm.com>,
        Mukesh Savaliya <mukesh.savaliya@oss.qualcomm.com>,
        Yadu M G <yadu.mg@oss.qualcomm.com>,
        Kuldeep Singh <kuldeep.singh@oss.qualcomm.com>,
        Abel Vesa <abel.vesa@oss.qualcomm.com>, devicetree@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
References: <20260914031412.140856-1-shengchao.guo@oss.qualcomm.com>
 <20260914031412.140856-6-shengchao.guo@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260914031412.140856-6-shengchao.guo@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: UDO231vJAhajEli8lCDUgoFo_HZDjnQy
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE0MDEyNiBTYWx0ZWRfX5OsBoiEm0a2U
 HvVEZqYp+7iUVJlHg+VG8KPEAjsyJFrxzcixrdWd2fWVOs9PEW5l4G0ex090j2kICDEvfEke+3g
 6frw/GCoaNkFMdCVeojeg1UFZSRyMbY=
X-Proofpoint-GUID: UDO231vJAhajEli8lCDUgoFo_HZDjnQy
X-Authority-Analysis: v=2.4 cv=ftpJ914f c=1 sm=1 tr=0 ts=6aa7b748 cx=c_pps
 a=7E5Bxpl4vBhpaufnMqZlrw==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=EUspDBNiAAAA:8 a=HHB2upKr6LlMs7tUYOwA:9 a=QEXdDO2ut3YA:10
 a=pJ04lnu7RYOZP9TFuWaZ:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE0MDEyNiBTYWx0ZWRfX1Y1qCh/2oPm2
 p2iE6CK3ob7GAR0x0M+OVDUvyBOuH72DSCz8J7CEAM4tpD79Nv/UxHBQFypIP5+y8qB+Rb3rYR4
 lXkLDlK6Et2WVc7gH98iHEecpNJIUQQgAugv3dPsCotWnCXwfv54ghQy8N0xW55ps6Z6ih+ekKK
 1DcWmWpp5UVKN7UC5G2Ot/vqz0j5FPWnHXd8Qe881J6DxqA2lhaOhduHbf1yYfGgpqca3sXR5Na
 FfYhIZ32TCNFEMoCDjiXnt1FGXXRHFhOBXXNJhYFypXm67GBTcaWs0HWRw67IdvBzLb5evVDZQC
 vKdR8PqyUwRF7NH1Rt0Q+hePQH/SmVD6x/9rXLEVT7acL7/ntURx0DYlMBu5DuLFhQErtjOJy8T
 n/gfsoMekqVcUbcKTEsQ2wA5F4hGBHsK2LFtfZYqgumOm5ITPR3jXq+/PVQ1isw+oNHiAkVfWSh
 MZUnokdH3VeIiwTNq+w==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-14_02,2026-09-13_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 clxscore=1015 phishscore=0 adultscore=0 impostorscore=0
 priorityscore=1501 malwarescore=0 spamscore=0 suspectscore=0
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609140126

On 9/14/26 5:14 AM, Shawn Guo wrote:
> From: Deepti Jaggi <deepti.jaggi@oss.qualcomm.com>
> 
> Add initial device tree for the Qualcomm SA8797P Ride reference board,
> which is built on Nord GearVM variant.
> 
>  - Configure UART15 as the primary console and UART4 as the secondary
>    serial port
>  - Enable UFS storage support
>  - Define thermal zones for PMIC dies, UFS, and two SDRAM sensors,
>    all sourced from SCMI sensor protocol on channel 23
> 
> Signed-off-by: Deepti Jaggi <deepti.jaggi@oss.qualcomm.com>
> Reviewed-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
> Tested-by: Yadu M G <yadu.mg@oss.qualcomm.com>
> Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
> Signed-off-by: Shawn Guo <shengchao.guo@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
