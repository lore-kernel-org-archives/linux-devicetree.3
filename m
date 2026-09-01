Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 36C4240DB37
	for <devicetree@vger.kernel.org>; Tue,  1 Sep 2026 14:49:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788274198; cv=none; b=VOc2Iks2p+sTZOgvs/g5DhxWuTBCujJb5/dtZSEngNeDS4Q+INGttvwilMqhEjQkA+IBNiYsdghTyf9KpKEztt6Uv0043LRP3GmcvIS5MM+T6lDX0Won6mfgBYJJoynQQd/kJXUNKchDrfVI+ajqNslLKyHwHbTSFoZMU2nU23w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788274198; c=relaxed/simple;
	bh=oQ3cm8m+Vrx0gjPA7jzySxcyyOY42vyA16mLgvFWbK0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Pz7Q1ds12SmNQk+pgyUgw1TPzRxNkYqu565O8a/hYuCjxZSYmI8451HaqVhCAS33mJ6XiJVOjX1xfc7UfRPa+rj6fbsafw3mJ+ivcVkPpPCQthbHceh8GWUOii9EiiqPuZzwCggHLOWKNmU7EP3qX/eA9o55xa5ZaGunIzu7u40=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=XgpveQ+J; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=JMJy7Co3; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="XgpveQ+J";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="JMJy7Co3"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 681E98Xa3257802
	for <devicetree@vger.kernel.org>; Tue, 1 Sep 2026 14:49:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=ASyO/UHu81+4tc+FHnlvZ1SX
	IpfFftTRiBx/6D9Fz54=; b=XgpveQ+JT11qyb+b9igFAS/UnnOvfS5gVIG/iGfk
	/8r8vW2Bt+U7Wa6Tj9BEHZ5OsERmBnJ3fpqemL3vg2i23rgawVLkDeNBnIoJfBGn
	lTfg1mEXuoV8oqjFUHWwnI0ORJTpzBDrxQE7rr9SRnZoe7hqyxq0TtGwuUy4UwAr
	MXGxC5jtAjHR8vxgeIzv7xCsEklDUBjyxnQYRx5MP0+/gWstXcjuRQWBc1/2289/
	pFnNWTjo+lNLaWj/iMUlHbWI1j8yvv6Eqw6sxg7lrWi5pB4bxmb55FkELh6O9oCD
	nyknlVHUS40qk/jmid7QfvIw3yk2I4dQ5MQhMzIGszkijg==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gdynt0cq7-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 01 Sep 2026 14:49:56 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-936e393061dso570087585a.2
        for <devicetree@vger.kernel.org>; Tue, 01 Sep 2026 07:49:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788274196; x=1788878996; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=ASyO/UHu81+4tc+FHnlvZ1SXIpfFftTRiBx/6D9Fz54=;
        b=JMJy7Co3miU75n8eSBDL30z9LM/YoBAlSz2/Z3ylby7erVxivn+KQwwTgP4kfzb9c3
         Dz7TVCJZEtr/NAuQYaj/VXXhG9HDVdThiKcweJzoudYYfI4N6cXglHkz/peaMZ3tTy0b
         28pVJ8tT8fk6vO0E5+GMEtUp78r35OYim5h0MB6IMOrMew+47GaS4rZZHJusvbJLgSSe
         EeCj+a62GB10wrHJheqg1NwYZyOUBGbXu9BdcFTAHGzEzlQMYWJ+RsE/cRAfqMSZPapz
         6srJR7Kti6SQjotuY7/4TK8+In8DjPdwjDF9mQ/4CfhjhF7rJFn/2K6XQ++920/eKK4R
         78bQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788274196; x=1788878996;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ASyO/UHu81+4tc+FHnlvZ1SXIpfFftTRiBx/6D9Fz54=;
        b=V6o1Tim49EMUhW71/F1Q4rgehl/JRsOEh1Md4loSZd+txMLIHsvV2p+oOMJbhFuS3J
         H1xVAsOuYCaWyq8wlNsBCyZONdrVdPYChTV5SRB8EWo6mSdiGL/HWu+GMAfEjb73vkYy
         UJx+UNCfuiO2HhGk5OaQo+Jut6e9Cm+TLlrO8bvuh9gUO868IDM/Q/XqoYK592ocIIbv
         llbyv66QUWsDslgS3e7IlOmizVmHuIs5hyL+FFbJ4v33ZJynk5+xOlgBXBpEsuOgPJ2l
         CgmhRA9Z0B2XPiJbGZlQ+6FmNFal3Nf2dng5HXfF41qU0ta5ZGlbJ8Jw7Uez2K1Ikm0H
         X4Vw==
X-Forwarded-Encrypted: i=1; AHgh+RpDPnXnN7DaDc/T1aXHslKCPJBJuTEDar3QHwY9u9aLkNYsjOPlVV5i9Qo8jqoGOhM/4chrJd2bCgxv@vger.kernel.org
X-Gm-Message-State: AFuF++m780UKroPtrWG1xo3p0gq5q7a9v3bapNmRa2O7bCz5rsA8XKBm
	YPzuvFLodDAeoK6+IJhs7SFWG+bBvR3sAfCV8J0chbqF4mdfoY3BmpnQVZYmct46u3HnkMRG0HY
	G9NUHnb++0A+YHh41KduBK2kcyQtJNw0q7zZ9HH/lBh/JYtl0+08zB4pGQthCkKk5
X-Gm-Gg: AR+sD12/yMJfR7RQ9q/0XyA6VGbIQq5Yir/ZoqifEOnkkkVQIH6rl+3vTca1fenBKkd
	HlMwi2M9ILTQbs+IAb/ywfpHi4y7MJKuYVUTEdZ1286r6DHK3XHHGQaEUcoPhdOTUs1ienCvESq
	ucM7ePEHJi+a+yygGO8MxuK6tanTuhIfoWW68l4uUdekXH5sMuxMBR/+mUoctUrdOXcMaFMuc3j
	K5ZCwwpJImjw2CBc14Tjg0jyH7J3IcxFK41ca9ZLzF0j62AilczsL/ehr5h5H3bcuZ4HaiAHZOE
	n8pr54zVTNGl75eyvR/2kjlz7UOOvIT+Pa6PhoM0a7aw6jY9Y1BsG3jXCM1yj9fCXQrTmVpr4Rm
	ngjZ8FSpGlw4qIA==
X-Received: by 2002:a05:620a:55ab:b0:936:afa0:3661 with SMTP id af79cd13be357-939138df41dmr3062413385a.36.1788274194689;
        Tue, 01 Sep 2026 07:49:54 -0700 (PDT)
X-Received: by 2002:a05:620a:55ab:b0:936:afa0:3661 with SMTP id af79cd13be357-939138df41dmr3062384785a.36.1788274192638;
        Tue, 01 Sep 2026 07:49:52 -0700 (PDT)
Received: from oss.qualcomm.com ([86.121.170.178])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48442d6e826sm5215392f8f.19.2026.09.01.07.49.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Sep 2026 07:49:51 -0700 (PDT)
Date: Tue, 1 Sep 2026 17:49:50 +0300
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Abhishek Thomas Varghese <tessolveupstream@gmail.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] arm64: dts: qcom: talos: Add RPi Touch Display 2
 5-inch overlay
Message-ID: <qvgc6ku5gnk5fil5cnmwiji7552ouxdqt7oig5lxqvarxw3aw5@4wd7imptam5a>
References: <20260901-talos-rpi-touch-display-v2-1-40f0e92b2071@gmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260901-talos-rpi-touch-display-v2-1-40f0e92b2071@gmail.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTAxMDEzMSBTYWx0ZWRfX8FXefU+ynLPh
 a6lsxhSWOepH9woQl2V3bdKTUcixZktVv4wWIPLwlGPYv0UBOHk07/VkPdX0aWAcSm9wCsOZSgr
 FF+RSc5WfjF/ExJTunD+l6qECRFhNNGQcfIGh5/OlzJ5BczF/SEVHspOKAJw4lKHg5YezKoN9fb
 sIe+SuTVZzkQNW8OKFePaXL7C/OzC9iJi8ic2Xj9uoFfbQIcfEuzGhzl4qida6fHCmCbXV5cXAS
 zZkjw7td2tHPvu8jd3j0IF9PS+hALIuFqLSanyqMeZ+XLZK36nNlpIP4/SmeKs7Yb4DIvvmewyX
 LIK57Hj80bAxaM8sS7tx5K0WRp10Q3DNb8nM5/TrNMJZBg9NAFI1OCtaa+Q1koXzlJ9/NvsMBKe
 IAplo7h2DUvml80rYhnzwdN+l5hXgTDnln5i1k/AfFtCxc+TXw73KCdo/k1RUTLmP1MpDLSmZsq
 A82I/eNjEDT/WQdjCfA==
X-Proofpoint-ORIG-GUID: kYWGnwcm5Lv9rxtdv5K9SIhTmX7qUVLh
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTAxMDEzMSBTYWx0ZWRfX6bPz6UmTPdpn
 5d+BkRE5/8TkfldqoBjENR/7KJz1ly4jWODf5KAqAFTY3XctDGpwQ3yq87HbrmnBxh6t6a2L1/I
 4dE2x2gSyre7DAMp5eXmujy4lC8bjhg=
X-Authority-Analysis: v=2.4 cv=LfkMLDfi c=1 sm=1 tr=0 ts=6a96e614 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=G5ilVN+faPP2Ze1SHB4iFQ==:17
 a=kj9zAlcOel0A:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=pGLkceISAAAA:8 a=EUspDBNiAAAA:8 a=23Cz_ppem3x0p0_49vMA:9 a=CjuIK1q_8ugA:10
 a=zZCYzV9kfG8A:10 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-GUID: kYWGnwcm5Lv9rxtdv5K9SIhTmX7qUVLh
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-01_04,2026-09-01_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 bulkscore=0 clxscore=1015 impostorscore=0 malwarescore=0
 phishscore=0 lowpriorityscore=0 spamscore=0 priorityscore=1501 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2609010131

On 26-09-01 15:18:24, Abhishek Thomas Varghese wrote:
> Add a DT overlay to connect the Raspberry Pi Touch Display 2 5-inch
> panel to DSI0 on the Qualcomm IQ615/QCS615 EVK.
> 
> The overlay describes the display controller, panel, touch
> controller, power supplies, and backlight. Disable the ADV7511
> bridge to avoid a conflicting device on DSI virtual channel 0.
> 
> Display output, touch input, backlight control, and concurrent
> DisplayPort operation have been tested.
> 
> Signed-off-by: Abhishek Thomas Varghese <tessolveupstream@gmail.com>

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
