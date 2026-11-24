Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795535967;
	b=XgM/Z5h+PKtWBCWYc8ZPwwBDTb+kg+FRah78PZdDv62YaP5bcUqffxofCa7FWp2op3a8
	 1nDZtxYV99wANMnq2G7D7+25SE/Uteqax2wJ6jCOkANU8O+GnOdbsEC7z1P9+Lo7JmrEh
	 VokWGLqfdUfrLirc9RfLSck+fk6S/em4lbhzcKcyJcmha0FBIvc6dlJ7BBdVD/+j6jJMA
	 jz+15z8Rvf7LAn/HGfOdr0VC7mPBRU7CcRSlqpyFBHfU6K+R46CvWpMpKAv1h/Ly/Ki0n
	 WwSk4wrFOQNRK077sAa1IfuVR/F190aFxbO8x+twV76GOcHHWnObCvODbvPNLawFgEg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795535967;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Date:From:
	 To:Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:X-Authority-Analysis:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=/ymgP2Pu7WfrUuR0Fy4lwiaAA6A/0Te6Ej2xHmS0V/M=;
	b=Ze4NOMImnGmD+MqccdczFu0t5fk6F5B0cMVfkreIB76wXo6wA+QFpmAD4RsZWWUlLKLH
	 EN9orYG5kUdHUED0CPUW7EDkQcmsxFX/+6hwE8AdNJ6C8F4BJJiYxGxNAYaB4k2HBq6sO
	 DRgA5CwqeAsX+ECfo1QuT3vuaNYcTMo2w5tZUA+iR2hsM8VykbkgQRu1JiERprQoXdIMz
	 61zGOoi1cFkE5mbpab59dfK6YBP+qXsT1cjQJ9ONqVraUMipTdPJc0kwLBC4u2DkS0d6E
	 DJBR4OaijfTaQ/q61CZPkOpokTvqNvLNZQ2K1SQSLfsihSV7DR5eE/+NZr2sKfWhadQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=hlANYajG;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=ZXEY6UqO;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D68E606A326
	for <devicetree@vger.kernel.org>; Tue, 24 Nov 2026 15:59:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8D68E606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=hlANYajG;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=ZXEY6UqO
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AOFL3DD1873400
	for <devicetree@vger.kernel.org>; Tue, 24 Nov 2026 15:59:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=/ymgP2Pu7WfrUuR0Fy4lwiaA
	A6A/0Te6Ej2xHmS0V/M=; b=hlANYajGAwfzuQtkjL7Z1sepk81sTBNe0e2I1s0g
	lynqJzSIsIMASN5QUcRZJ3hEQLW74fxs95U3LTmEgFJeC1g0/1NTguzQWv8JPI0W
	Pf+pjLSfu5d+AIzshnM11SLo+mraXwnvYXC9BSFWIGkB1/3IXHnDSVDs3iXyK5aq
	Y+9NiJc/sfQN9NV8isFfuce2snRaXJlCTA5qtoZmKnYaKGspOq4p5Ym4PaCzsW9a
	2GybjN1B2vQYl1dLxj7QfF/9l43uezRjguqc9Tw4IYviS6tWdp6DI4n3he+qtuqW
	ow03grJ7k4LSUxyAKMr4qHr2BikAUly016ub9E7Vx0wAdw==
Received: from mail-dy1-f198.google.com (mail-dy1-f198.google.com [74.125.82.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j5cxk87m3-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 24 Nov 2026 15:59:25 +0000 (GMT)
Received: by mail-dy1-f198.google.com with SMTP id 5a478bee46e88-383ec96a7deso5315481eec.1
        for <devicetree@vger.kernel.org>; Tue, 24 Nov 2026 07:59:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795535965; x=1796140765; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=/ymgP2Pu7WfrUuR0Fy4lwiaAA6A/0Te6Ej2xHmS0V/M=;
        b=ZXEY6UqOpXHPWqcmAM5ep6Skv4usENTr9hn632ibSgocWlHAFS/iCvuPKJ+nSPEqkW
         O6ChHdRD646MrlGTYwD2pstJ+zolm8dy3XoYppm5R4rhykxCOdaieq+oSJlnvLWVQhgO
         TLZqvm/TTpan6TvVOHDfKT2x15qJb53l3M5v0gd7efrH2P5GFtO+5aSz0H92qKttD8yW
         PkRuwvC6khJfnbsjkZ1nRHrjSQMErRy6sxv/EfLQVMPJ+kleWOoPIrV0qFk1xp2apX02
         Qalr9cTBAIpZHjVmMKst7NA5t6+5cUKzExyKjAbXGFD2+vWfCYOV71doXReb5Y/lm/VQ
         c/jA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795535965; x=1796140765;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=/ymgP2Pu7WfrUuR0Fy4lwiaAA6A/0Te6Ej2xHmS0V/M=;
        b=mwk60XkQ3i74/ZR8lMIu+KSyBZuWa0WMgkvbyHbuGkCVRBObqPOif7w+crkjLX9RzC
         TczHGraqaa9N7Yv61mdmD2f/mQRpMpsL6KHFQ06wr1egVHIlhl6OPaIbTZZ8z4tdb4ok
         YW7dTItmbgtyo2c5wClXMUGgYKXkug0nOkJORernRxXgEu3DHwxYF3KhSZhEnQh7TmuX
         hJiYOfI0TBn55FeLNn1hx6fCqk/5u79QTvLxC8jJ++Bic6ErQ7juAUiSq43fPsSktt3y
         NqeJSNHu1z7c6c5kfh0LHAKj+mkCR4AMsOh500obpGsOGkbCTSmKAebAMt1+MvKF9G/p
         ABJQ==
X-Forwarded-Encrypted: i=1; AL+hErFY4G+sXeOvJ52on6O73BZtptCQe7c+BtU8n8g09hzoFDsdR3p2GCjmtB/Ux4uWdFF/++GxTHFUg56K@vger.kernel.org
X-Gm-Message-State: APuU4Z/Kz9tECyMCgJsEe9oJjpLO0s4aOdzhIdVYLTMOolLg5yjLHFuC
	Rv+Yo4rtftTQhJbXGDDUUXQ40a3BblPRjPU4WolB2sV0gPwoTacxC0wea6npcq3ZgnVsxX6EMsV
	r/Y4xSv/D656xttOrfFrTm6USOALB8h7abAT7cd9VI0XVqMSWRE6p7H6CFa/NPl2T
X-Gm-Gg: AZFdTZeodrrhocqroNfHJE4jrQHJzzKMzZMXmaVw2q6nUvFPrOG/2NqeUXsqS4nui1j
	Kxu7t0cyWUJ9OMuM/BvUby/ixyr7tfsEsIBYtnDQ0VDOR9torESkKIe/HjEuQcm9LeYORuj+Q/6
	VaKco+iDKa2Cp85z/gVIszgwvJrx4xZizMwHqoakRN3wT9qDhpYhheiK9bcs/rgw87NmQZx2Y+U
	FotqT5BkhIVNe5el0SmLSxCC3peYRd+FvX6DmxcAGiAg82mtsDYw0lqHuR07WIAouEJJGZjSX8R
	3vSFMYEP9414TkkJO+zQO6RdxzWr9dBZJLTOdfEXhtEmnObOqHpkIVNXNgTdl3t1U2YfHkLyXP0
	OAjj27TQ3EZOCgcuehgUXjM7DISKabjEin6A93dzn1bRzBvIsWMcEXGZ2TG0EMj0=
X-Received: by 2002:a05:7300:de44:b0:375:c5e1:931d with SMTP id 5a478bee46e88-3857073ebabmr15332083eec.25.1795535964839;
        Tue, 24 Nov 2026 07:59:24 -0800 (PST)
X-Received: by 2002:a05:7300:de44:b0:375:c5e1:931d with SMTP id 5a478bee46e88-3857073ebabmr15332040eec.25.1795535964046;
        Tue, 24 Nov 2026 07:59:24 -0800 (PST)
Received: from oss.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-38566cd46c5sm56303922eec.11.2026.11.24.07.59.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Nov 2026 07:59:23 -0800 (PST)
Date: Tue, 24 Nov 2026 21:29:15 +0530
From: Mohd Ayaan Anwar <mohd.anwar@oss.qualcomm.com>
To: Gopikishan Thawre <gopikishan.thawre@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Richard Cochran <richardcochran@gmail.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, netdev@vger.kernel.org,
        Vishnu Saini <vishnu.saini@oss.qualcomm.com>,
        Khalid Faisal Ansari <khalid.ansari@oss.qualcomm.com>,
        Ajinkya Inchure <ainchure@qti.qualcomm.com>,
        Anuj Tripathi <anuj.tripathi@oss.qualcomm.com>,
        Sushrut Shree Trivedi <sushrut.trivedi@oss.qualcomm.com>,
        Wei Deng <wei.deng@oss.qualcomm.com>,
        Karthik S <karthik.s@oss.qualcomm.com>
Subject: Re: [PATCH v4 3/3] arm64: dts: qcom: lemans: Add LeMans Draco EVK
 board
Message-ID: <awW0U9S/bzxf2k3h@oss.qualcomm.com>
References: <20261123-lemans-draco-final-changes-bringup-v4-0-dbfc15cd0883@oss.qualcomm.com>
 <20261123-lemans-draco-final-changes-bringup-v4-3-dbfc15cd0883@oss.qualcomm.com>
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
In-Reply-To: <20261123-lemans-draco-final-changes-bringup-v4-3-dbfc15cd0883@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI0MDA2MiBTYWx0ZWRfX3PAJ7gIiUx04
 kGtHTUxaerbHpeU/CN6hEGXxCf7rfqUuKh0Bt5jrTVeK9bDrN3a1CHvQd+S99Q0B2C8DkdGc1WZ
 D5u2kNnxZNrRUV2y0W/zqUG90qZbPgXvB7cx/Vx48ykBaTEEAVCx3zXEGjCtfCBGnmCMXS6nsbc
 Y0v1acIObzqJbw2xUrK0DSCuJIWDrGMz9mlA03My5ZfPILgy3BRJepg21Kgh5D7sNsj4Gk+5lSV
 9/jFOZXtvtx8hXI1KXO1f4Ndgzt97uogFkht5yC1EIOqA48Dgv/1WNUpKxnnZ+i7IjVCb7AsW2C
 mneKQSayldzu7iNnPgcqYhCn55VXhNAF18vTqUw90nx0WZCY1mHDJ5DarmeeYPPxZEvT4CYeY32
 7aD+f+WDm/vXAkdwmlkepptBQ6mvaUKxMWvM0YCSgjcWi8TJ69YTQQCAfx1b67WPx2zweuJwosb
 pYOwxcD4QqNJeXh+XTQ==
X-Proofpoint-GUID: kCfnF9Qfy1vkgxdISWdWvKVYsbsBQ1S5
X-Proofpoint-ORIG-GUID: kCfnF9Qfy1vkgxdISWdWvKVYsbsBQ1S5
X-Authority-Analysis: v=2.4 cv=TLbQ2Fla c=1 sm=1 tr=0 ts=6b05b45d cx=c_pps
 a=wEP8DlPgTf/vqF+yE6f9lg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=kj9zAlcOel0A:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=sHvua49BMD8LeQgnyuYA:9 a=CjuIK1q_8ugA:10
 a=bBxd6f-gb0O0v-kibOvt:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI0MDA2MiBTYWx0ZWRfX3xJu62/i83Lf
 u0T4SzP5Ypz3rfQrINnx+xYwuQ+feLDL15pHtDoF6m37lOTrbg9w+p/t5/y3nkcuTvE9z+IRpnG
 gi8fNXmHR0sVuiyRX/QV9wnL539Zdz8=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-24_04,2026-11-23_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 impostorscore=0 spamscore=0 clxscore=1015 suspectscore=0
 malwarescore=0 priorityscore=1501 lowpriorityscore=0 adultscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611240062

On Mon, Nov 23, 2026 at 04:23:12PM +0530, Gopikishan Thawre wrote:
> Add the device tree for the LeMans Draco EVK platform which combines
> the LeMans Draco EVK SoM and Draco carrier board.
> 
> This device tree adds board-specific peripheral configuration on top
> of the SoM, including:
> 
> - I2C GPIO expanders (TCA6416/PCA9534) on i2c2 and i2c18
> - EEPROM with MAC address nvmem layout on i2c18
> - Native DisplayPort output (DP0-DP3)
> - Dual Ethernet (ethernet0/ethernet1) with HSGMII PHY over SerDes
> - ST33HTPM TPM over SPI16
> - AMC6821 fan controller on i2c4
> - PCIe0 (connects to NTN3 switch) and PCIe1 (routable to x4 slot
>   or M.2 M-key depending on dip switch configuration)
> - M.2 E-key connectivity slot with always-on 3.3V supply, PCIe and
>   UART graph connections for Wi-Fi/BT via pwrseq-pcie-m2
> - Audio playback and capture via max98091 codec (Tertiary MI2S) and
>   VA macro for DMIC capture
> 
> Co-developed-by: Vishnu Saini <vishnu.saini@oss.qualcomm.com>
> Signed-off-by: Vishnu Saini <vishnu.saini@oss.qualcomm.com>
> Co-developed-by: Khalid Faisal Ansari <khalid.ansari@oss.qualcomm.com>
> Signed-off-by: Khalid Faisal Ansari <khalid.ansari@oss.qualcomm.com>
> Co-developed-by: Ajinkya Inchure <ainchure@qti.qualcomm.com>
> Signed-off-by: Ajinkya Inchure <ainchure@qti.qualcomm.com>
> Co-developed-by: Anuj Tripathi <anuj.tripathi@oss.qualcomm.com>
> Signed-off-by: Anuj Tripathi <anuj.tripathi@oss.qualcomm.com>
> Co-developed-by: Sushrut Shree Trivedi <sushrut.trivedi@oss.qualcomm.com>
> Signed-off-by: Sushrut Shree Trivedi <sushrut.trivedi@oss.qualcomm.com>
> Co-developed-by: Wei Deng <wei.deng@oss.qualcomm.com>
> Signed-off-by: Wei Deng <wei.deng@oss.qualcomm.com>
> Co-developed-by: Karthik S <karthik.s@oss.qualcomm.com>
> Signed-off-by: Karthik S <karthik.s@oss.qualcomm.com>
> Signed-off-by: Gopikishan Thawre <gopikishan.thawre@oss.qualcomm.com>
> ---
> ...
> +
> +&serdes0 {
> +	phy-supply = <&vreg_l5a>;
> +
> +	status = "okay";
> +};

phy-supply is deprecated. The SerDes PHY on Lemans/Monaco actually has
two supplies, so this node should use vdda-0p9-supply and
vdda-1p2-supply to describe them.


> +
> +&serdes1 {
> +	phy-supply = <&vreg_l5a>;
> +
> +	status = "okay";
> +};

Same here.

	Ayaan
