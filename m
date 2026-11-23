Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795462412;
	b=YtS/XyOCvyb6Vf2eh+iC14lL/lsJZppEJJhhzIo+obm8XylNYYEUffUKnDqKQHDyKnJ/
	 icBm84tKXyDD6ieImiEdmPT9FqKpdSmS23+5J9IbxsFj0Oo2gwZxt7AhFZbNdbbo5AhmI
	 2ijB+k+m01TBp+OikodC907Mn34PfAfMNyPKJqWai5yE5Ak6TY1GQJNY0NoxX23H+6Umk
	 +FFaeeleH2KQhg59eWKb8YkD2NQBNpFutAzEvllB4cBKBYKOWzuQ5X29GWaN4gsaY4geC
	 RY/PyBirIrvFu1R1SOhmm49xjUYbxv6/PwqOA59r23viZvzD667WjeE6uoBXq6PCGCA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795462412;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Date:From:
	 To:Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To:X-Authority-Analysis:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-GUID:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=JHSEjavsqM39bkuCvnDFdHwV3w2gEjGXKFceSnNzYy8=;
	b=pOBxhpSczlovvtf+7FBw67qsXjgoi00AzCW0Kyf3uz0ghwbwKB41a/efxpMdFzyfS81d
	 /ecyKxgZz/9tqPiwzW2m4GKt5zjtkV8XenXHvojIbjXnY17cIVTV4jw7wRJo5z9iTDKsy
	 yfERE2MQ912o1r+jHFn8L65MkZ6Pa98M8AHFBmDk2LYtZs/AQFc4klJAWnvN7udPbnMy3
	 7Ktb83Kb8P6qN0CwL8Kpj2Za1fyesOh59ChgYfph/cVun29HhqL86Kimxsu2PYx8Hg0bY
	 AANOIOxzexOt7JexqDQiL7RhAWUraI36WO320wJeqfHnvwztlEsPn5zBBtiM5OdypmA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b="lbad/JWJ";
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=V3UJkNfv;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 13217606A327
	for <devicetree@vger.kernel.org>; Mon, 23 Nov 2026 19:33:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 13217606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=lbad/JWJ;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=V3UJkNfv
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6ANJNKF5647193
	for <devicetree@vger.kernel.org>; Mon, 23 Nov 2026 19:33:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=JHSEjavsqM39bkuCvnDFdHwV
	3w2gEjGXKFceSnNzYy8=; b=lbad/JWJZ23cBq/OixXbP4rSo6w/e0xsnm36Ki/+
	/HM51Zy3lNuoHUVZ3PkJybcQulJI04EEcxSgw9tGFNWpx+foTSe9TFxMc/zUqm1W
	92LK1CCCln2ZrcP6QuF9GZiZGAua/iJllR56i/Fq0JV7q1xqP7Fpp84YAPzUdRT8
	Owx0HqCj4jMgqvMmsrgYct3nE46PmYB4mz9uker/P0p9aUBYNa2RGAfqvPsugBmt
	BSyJ3lUjKHNWxz3Npz5vswwEC9OcGPu8p9nAZcGLWmhNgd49ex93dx9Ejo3qvGcR
	QGY1a4eugZUay8SX4qcbJNMm4wHxCtFVsuASfKj2bO1g2g==
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com [209.85.219.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j4ukqg15q-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 23 Nov 2026 19:33:30 +0000 (GMT)
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-9213c7a506fso8440166d6.1
        for <devicetree@vger.kernel.org>; Mon, 23 Nov 2026 11:33:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795462409; x=1796067209; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=JHSEjavsqM39bkuCvnDFdHwV3w2gEjGXKFceSnNzYy8=;
        b=V3UJkNfvkYFEiT3bOJjoBztZaUrSNwinbxmtvpvrnOgcBK1JdpnWw3JCAvOixfqNfV
         emxRSp8KGVOoRRnvJANtA+FLzM9AA22v9hIHjw/xQvjC7295xWlTUYm9spXSXexvSNcS
         Og5ZrzoBLMPGTfpprr7WeqV6Vdh0kFfXcJblAONM35qpqNUPzmaf8OqE1BcRTXMRibnj
         xYoYNG39bkvp87ZoMiL1MOT75xwd2m0yqzaXBgPzFs7rYSRKFZD9AZE8fT7goEK8FToY
         oTk5O01rHcfND/Q2sG9+/AK8VmtQwu0TK0HpL1UDRcpIrbxhBhtIV/+Di7M9iziPHo//
         a79w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795462409; x=1796067209;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=JHSEjavsqM39bkuCvnDFdHwV3w2gEjGXKFceSnNzYy8=;
        b=lq1OA4fTyuHKDeOr99QWqusPcgNpSy4aNgeJ5rCiOtUis8obhSo8hDBa29sRP26QXm
         PCHlpG6b0Oiszz6H7dbg/aDNNOvuZReKSIiyXHWQESSSrPik3d1UZXtJ+WM/FsQPVVeR
         /2M1ClvZFMLjNQZwuPrwJwXXtuzuWtqRg/wCob6I7/WyfiOHJe5tYuSym1cVLkirE0yM
         2Ss0QD3HsocCc29QUnpqwS7Bby/u5fYcvjyU7md5/1pCXlHuC1Lzs9mmbi4MK+02yiO3
         Sew3l36zqc/mET+5YCO4TLmGEXS4LnHJHAjsQ5ssm/Ew8fatk9vo89fHVeigH4ESCuEy
         KzCA==
X-Forwarded-Encrypted: i=1; AL+hErFVwv9ntl8LL5t4ghjuJBftvdB+5jZrioI7puoM7T5KNk9c2qvBvPyu8IFoYj5VqnwTKJwWHD5L0716@vger.kernel.org
X-Gm-Message-State: APuU4Z+TIJr35iUgOIwvSrznLOpY4yV32wtdqh2IF2NG+vDwx0Lhw0N9
	olGQn2/Eb8MIx4fuHs76aPiITwENfpnXC+lALxBOdtN9OJDw3dJXJAeudrsRbQe92dzd86D8PIW
	q6/kGDN4VHV9pee7lRUBTjKH7Ll3BTwRCouJ3lFFOQAmDG8ZmeP93UtClXFesZuCHoFqPZ1fK
X-Gm-Gg: AZFdTZdDAXCO+A1VVueeIYnOPOQqD4fffnokq92QcJy8COGdWo83HKaPyt9NzE/YvhT
	QtlZzKGsBiS3Ev5axDnLv894fWUAyoFPJGb1gZW4NggA5GL26PmgomLGqxHgJtbTDJUK0z8LE8+
	H+4gFzVHDk5Q9XHjq6UD16HWihvWj8PqDc5ekEnjLG4CsK9eYrUDhfhx/hzywaFk4hrCRnrUnmD
	mbw/M+yy641J6GkBoXKgJPMkb9sx5IxeATpwhD5VRoAheK69tTnA2iJqVNjBeKozM81bAImM7Q1
	vx4UTBWQTBhZ3uS4qoCZeMcVDu6lYnIZWg3VbsUxwSgrGkAZ79L0k/VEdImU1Zz8q04Fx5/bLbl
	59a10GmDLHX3kYkbf68psMaEGKUQDZOIyzu4iiEqc/HlbtOfX9ahmg4aB9X1/OSsl
X-Received: by 2002:a05:620a:4607:b0:949:7acd:3c31 with SMTP id af79cd13be357-949ba6b3d57mr1962699285a.0.1795462409207;
        Mon, 23 Nov 2026 11:33:29 -0800 (PST)
X-Received: by 2002:a05:620a:4607:b0:949:7acd:3c31 with SMTP id af79cd13be357-949ba6b3d57mr1962694285a.0.1795462408555;
        Mon, 23 Nov 2026 11:33:28 -0800 (PST)
Received: from oss.qualcomm.com ([188.27.161.77])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb9067a0e6sm153451815e9.4.2026.11.23.11.33.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Nov 2026 11:33:27 -0800 (PST)
Date: Mon, 23 Nov 2026 21:33:26 +0200
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Komal Bajaj <komal.bajaj@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Kumar Patro <bibek.patro@oss.qualcomm.com>,
        Jingyi Wang <jingyi.wang@oss.qualcomm.com>,
        Luca Weiss <luca.weiss@fairphone.com>,
        Shawn Guo <shengchao.guo@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-remoteproc@vger.kernel.org
Subject: Re: [PATCH v7 5/5] arm64: dts: qcom: sm8750: Add EL2 overlay for MTP
Message-ID: <hlj4ucudy2shejlwc73qtviz7yasoyfbcrkp4dnkan54tgzru7@tfdtsgz2zhck>
References: <20261120-shikra-el2-v7-0-9d9000eb50d4@oss.qualcomm.com>
 <20261120-shikra-el2-v7-5-9d9000eb50d4@oss.qualcomm.com>
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
In-Reply-To: <20261120-shikra-el2-v7-5-9d9000eb50d4@oss.qualcomm.com>
X-Authority-Analysis: v=2.4 cv=Wu++otfv c=1 sm=1 tr=0 ts=6b04950a cx=c_pps
 a=7E5Bxpl4vBhpaufnMqZlrw==:117 a=asF+/XNaGoxFafzDDLC1GQ==:17
 a=kj9zAlcOel0A:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=EUspDBNiAAAA:8 a=RR6Oj5ZeI5PBhayghEMA:9 a=CjuIK1q_8ugA:10
 a=pJ04lnu7RYOZP9TFuWaZ:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTIzMDA3NyBTYWx0ZWRfX44xdE5l6Dxr7
 OGjIBDS+Gx+QvRUYwlG9W8OWWiYZK+2quuDC2EeP1in+mUV0L1S+9FMkEylOZ8TK7rbO82/gLgo
 um5oevZNE+J4i5FdX0trzVgnKIjA2mPiG7cLuiNLV7iSQ6f21ZlW5I6skJ0GNDYWszergHNBqg1
 Ab/MQmNjxSwusLTLC4gma1Q3qiNDUSEOuv/BU4HrSmpdZ+tz3tYAWkX9VLST6R6Nj++Eyq06PjE
 4ssCgLO/qhYH0yFM68mUPRoRsAnSqiHIdQ6yFOkvbgOO94fcV9b4OZf5y5F95SXLZK8llM22AQC
 kQ7ObWrxOeQSTpPKwRMYhGLcLp7iBoyqJxhqLD2R+3/JTa0wMn6Vwl1LRAaqlze8zwcNeXFt1wZ
 YtXI09fH1wyUFFUPjMWnGxUutIAcZT7vlGuJdlDn8wdGcR/wdApC31rAOMYtlL/j6rNB/gdDc/4
 MTGUHzBH3guZz/GSlNg==
X-Proofpoint-GUID: PvVR8cWRWsV4QnNFGwS--lbU3_QJ4jJd
X-Proofpoint-ORIG-GUID: PvVR8cWRWsV4QnNFGwS--lbU3_QJ4jJd
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTIzMDA3NyBTYWx0ZWRfX5pkfxT9Kkx1R
 4ooImMaHcxhPcNXMBD3D/J6JLcR/Wpmr2YoylvUvDIurO1UJdAzGvwHDReIQJd/ufWukoialA0d
 NdzirpuSABDNvvRj9tsvynfV0N16tPs=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-23_04,2026-11-23_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 priorityscore=1501 impostorscore=0 spamscore=0 adultscore=0
 lowpriorityscore=0 suspectscore=0 bulkscore=0 clxscore=1015 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611230077

On 26-11-20 18:50:53, Komal Bajaj wrote:
> SM8750 boards boot Linux under the Gunyah hypervisor, with Linux
> running at EL1. Linux can also be booted directly at EL2 on these
> devices.
> 
> For EL2 boot, describe the IOMMU streams used by the remote processor
> firmware in the DeviceTree consumed by Linux. Also disable GPU zap
> shader and Iris video codec.
> 
> Add an EL2-specific DT overlay and apply it to the SM8750 MTP to
> produce sm8750-mtp-el2.dtb alongside the standard DTB.
> 
> Signed-off-by: Komal Bajaj <komal.bajaj@oss.qualcomm.com>

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
