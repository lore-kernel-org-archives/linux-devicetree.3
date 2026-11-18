Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795000777;
	b=ItiWKyXI/L2XF1ddbT144Sk7PsNraGEGmoxbDbYvg6ShMNywG4/FGmFsuvYvjLx/ByhA
	 1Mdr7J9HYcgy+LyWFhWFnN2hZpN37K1H/Z/a4tuTa53z9J9hvNOXydOggvJr8vcrbb3mU
	 cPCm5hIXstNsbE8yu1VjBGatfzotBDxtx5s/YBn6mOLpjgNe/IgXW0eZHwY/Fc7KlyS9i
	 G+PMyY7FAzuTQApsOSnR+Dn5xSiu/Ynmm8bO/OpPD/0hSq2X9OlqYRN0axcla+E67qqVc
	 Y+os5EoUykJuxSC0JNgr5u31loZQ2ilTODJtQ1wbaVl53xMc69Ec2XqTDWbeLpWMf5g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795000777;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Date:From:
	 To:Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To:X-Proofpoint-Spam-Info:
	 X-Authority-Analysis:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=gfdUdOtc3RiS06TxKquH3bKPEIXQE/OFSkda9ogMo9M=;
	b=AFlxDk5VrpSlvJ+76y5fsbtM5FWtZABDWhur7hTz8S53TRX9aUiAnJfr4sQtCSELOjkA
	 EII4CnM1Jb365puxXQA8J+kq3vgJ6cA20LcZf702Cex3ZWxxXXvaBH+UbQBirp5YBzoKS
	 nu+MPTtObZes5ilPpbbnS0+adZthXqsz0gGlvoug6QAt8aGef46e3cZFRGwtiFIDDWQNG
	 yYMwvCxWumAZooBPvQbBtKpRhEe0mTE8DmfG0VNRmrygk7kY3oCWKv4dhPN/UU9I+jusK
	 TYDmnUcmxT9EXPQ93+QHapMOudCkwEbNC/R2S58qK1b68qzhc5Yx4i9HjZTn+tCHCiw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=M6dMGV+w;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=AShNKIfB;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 734EB60A2605
	for <devicetree@vger.kernel.org>; Wed, 18 Nov 2026 11:19:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 734EB60A2605
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=M6dMGV+w;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=AShNKIfB
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AI9kKQN3420240
	for <devicetree@vger.kernel.org>; Wed, 18 Nov 2026 11:19:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=gfdUdOtc3RiS06TxKquH3bKP
	EIXQE/OFSkda9ogMo9M=; b=M6dMGV+w/8Gc4TL7JcdVB47TpayE6jT2Zl/j3L2+
	SIYV2p4JERPooYOkfo03opj5K4yaqbELYTCnPO9xAtfgZCgYHnCWbR2wcvA5ub0g
	u/f0RJQIaK0NQUZ2FfgPp5VNiWvvoXLUbgxns3j5UxTcE+2jfLfINm9+UzN1sB7f
	dSm6C5Y+WSYaQwX550EF0QQ/QMFQTFs6ymB5YqpUZFsxZhvRd4INBZ9wbZys9HQ7
	t/mP8t5GTIJtv6qP4L0/vnMFqJUL6Go6eBdTGFTMHayclA3aRcva21HWOm4q5whi
	T4tf5tEJ1XPLXRMS+8OWMPQQSBPO4EZ7HicNgXnM4VLn1A==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j0yv9ara3-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 18 Nov 2026 11:19:33 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-9495c71055bso189256785a.2
        for <devicetree@vger.kernel.org>; Wed, 18 Nov 2026 03:19:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795000772; x=1795605572; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=gfdUdOtc3RiS06TxKquH3bKPEIXQE/OFSkda9ogMo9M=;
        b=AShNKIfBp0yUBo9FJT0PQZHFRRd22TjVTNKUeHR1S4/dgdXY4TLyRAE+CzQATbLuD7
         9yVrUXWPoANLu1mAPN34YegVkwL4pcXZdIXZ4GotrMnB/vk5jwpD33eHrwX16RCvgUY6
         jtwcuTmkcpR3jsIwM1UmK8BGx9GPGPVL2bqxvmQphVe19L2qjNWRWsdF95FNHGNKJ/Zo
         E9ao7i/NhTsXSymR4mXIZxUS5rRJKJg4Fuufgdzu8wUxHSoh7zlEur5lBJ9O7GcLPVVm
         A/k8PGw+GYNiMRVOzltrxOaG67ndzfl1Ao7ypbFsSNBEJd1UG6qxCYLogHkmOEbRgcce
         zOhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795000772; x=1795605572;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=gfdUdOtc3RiS06TxKquH3bKPEIXQE/OFSkda9ogMo9M=;
        b=EoAGOgxnVSzh4vtmi/Ngjs3F+fj1txA627JsiR1J/9Ze5zsSF4azscDdRvVia1N8DT
         6BB1AP8z2kFtZmBEhX0nKQKw2E4viOCpNze/j9VQ+5eBcQKRpMWpvKLd3ezGOpxX7kFO
         9HuRc7503TQQ/12LkVgPLnkhaGqztijyMUFy4SUKaWrGIEzm97gIywHJey37voGGnJlL
         l4UhjRyrYvgrmbFjGrJy8y/x/6abv3uizT+xDixQPw4WjeSgP36uHXLriT091pkXGMvw
         bALdesia6kUer7LuHwXirX8yJun21F+J2enaEtLszbWpaaNuKitg58IE36qmy0ASjY7Z
         +Exw==
X-Forwarded-Encrypted: i=1; AL+hErG4/oa1lhFbxEYLAPBaCEGWN0ICEVERu2S9RX/7QcLGc7tYEYRoIRLDbivb44H1QSLH9Fpd7T0CHVeX@vger.kernel.org
X-Gm-Message-State: APuU4Z94RJThgcU40Awyj5+DSOB4bVmTR1YPgshf5HAEuTWs5Xw7CptT
	eA+RvdK0tZIhbGKkr6iGYgiM13CKqPUa1lYsX5/P5xBDTKVaCLqloL4xNd7rOzMj8c94FRC0dlB
	QsAS9Ze0Vq5rV0rOzg+PkmlQFZo6/mN250BhP55nfUJXNH1NBX/ADFKtTRwNuMw/C
X-Gm-Gg: AYBFou0/Er+tXbrVhe8RVgLdiRhZRAciZBXsKc6REeLtuWcRxhP+WdaW1c4dFnl1J2/
	KFhqeYnqWbQMDJIHNVrpaUrGXOA4uRw63LmeT7GdSdAYjfqvIPV09jgoMQuazPrC3nMCDZRYotf
	CxW1n7nIwgtYGU4+MMbgtYMjZAFSsy84nzRfu0yP8mX2jfWuvU8+X2UrM1KxZujMmlT+uQBLLJj
	uuwCQzjguJfmd1nh2fwXiLMfOuUqYx7nCe4QDUF63tniX8IKtEavSP6O3bFPh+T8UpEuorWbFmQ
	3X3GCzaN6GO10+5WOYo3Vi8uNuGtqBds0q62uhXNaEwL4WlWBY7dX6UHANyMBOxrGrdo7OV4lvd
	JvcWeCm0F+1vQPvRhtYpvHoOLS8pgojqIBd8lw5sIcr3tOLRzteoioirIlbeA+aMzqqjkReJdre
	+KSDQtobB2I+A=
X-Received: by 2002:a05:620a:1992:b0:93e:5060:f929 with SMTP id af79cd13be357-949997218eemr370171585a.19.1795000772539;
        Wed, 18 Nov 2026 03:19:32 -0800 (PST)
X-Received: by 2002:a05:620a:1992:b0:93e:5060:f929 with SMTP id af79cd13be357-949997218eemr370169185a.19.1795000772100;
        Wed, 18 Nov 2026 03:19:32 -0800 (PST)
Received: from QCOM-aGQu4IUr3Y.na.qualcomm.com ([195.50.164.66])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb7d29c7b7sm47426705e9.5.2026.11.18.03.19.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Nov 2026 03:19:31 -0800 (PST)
Date: Wed, 18 Nov 2026 12:19:29 +0100
From: Shawn Guo <shengchao.guo@oss.qualcomm.com>
To: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Cc: Shawn Guo <shawnguo@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, brgl@kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 0/2] arm64: dts: qcom: nord: add GPI DMA nodes
Message-ID: <av2JwTRWxL2BXU8e@QCOM-aGQu4IUr3Y.na.qualcomm.com>
References: <20260921-nord-gpi-dts-v2-0-4f297c983b94@oss.qualcomm.com>
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
In-Reply-To: <20260921-nord-gpi-dts-v2-0-4f297c983b94@oss.qualcomm.com>
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE4MDA0NCBTYWx0ZWRfX/WQyAN+xf/es
 2jFP+9A8em43RwdZYP40FEzQk0fafau2WyIhp1f7e7FG9+Mvyj2Qqcqq94/qJzsqgZ3wpmsuqqu
 92bSREaeloDKuKeGiiBu8rsqZbROHQo=
X-Authority-Analysis: v=2.4 cv=acT0Dhot c=1 sm=1 tr=0 ts=6afd89c6 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=Jk2/TV77q6/E6wQq2oQJxQ==:17
 a=kj9zAlcOel0A:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=bC-a23v3AAAA:8 a=Mc1FV3LHUU5Qy8fZID4A:9
 a=CjuIK1q_8ugA:10 a=IoWCM6iH3mJn3m4BftBB:22 a=FO4_E8m0qiDe52t0p3_H:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE4MDA0NCBTYWx0ZWRfXxGO+N4XlnoCe
 uVAECwb1mMCqlOMhQkMqJ8osk5aoISecSHb6V6ZTpJOgy8Dt6hrvxKZzhWKtpIszR+cOOqT5CoW
 vxPNjnYFknpFCm5Vbr/+5HCiMU1zBytL9BGCJjzkRej9Oe6LD6+SxSXjHYWTymlqGG9bqGJ/HJa
 nny3WW+52SW7KO8DUnJiIMzuT5IjE9HrusBG/Ahv7Jf2EdXLi4pCSG3Sm9xF2cqistN6UFAqpsy
 SZQp6L9Ny4bCM/SgPjfYozavlSltKy8Pit0BZKVgF4gHj7RcKnlkaUxq3LxFUI+Sgu2pEGS7awj
 n9jioGlW4SLwiBiWyh3qpfV93X7oS0jy57IwqWbc0JlcNEPGb35dNEmBsMYAzMtrogWeoPNxHFu
 Ti2NfPyeBlwIe3404KDXzfY1zyReaTceW3JgRm4nCbY0Qm6E3F5DWPpHyNT4C3G2s2wCLRnIrfQ
 19dQiLvclde1mYa4J1g==
X-Proofpoint-ORIG-GUID: FfY0wpm2CaR6893Uasf-p3iMqlTp2ASq
X-Proofpoint-GUID: FfY0wpm2CaR6893Uasf-p3iMqlTp2ASq
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-18_02,2026-11-16_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 suspectscore=0 phishscore=0 impostorscore=0 bulkscore=0
 malwarescore=0 priorityscore=1501 spamscore=0 clxscore=1015 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611180044

On Mon, Sep 21, 2026 at 04:46:57PM +0200, Bartosz Golaszewski wrote:
> Add GPI DMA nodes for Nord and reference them from the QUPv3 I2C/SPI
> nodes.
> 
> The DT bindings patch was sent separately[1].
> 
> This series is rebased on top of current linux-next.
> 
> [1] https://lore.kernel.org/all/20260916-nord-gpi-dt-bindings-v1-1-857bf9e84999@oss.qualcomm.com/
> 
> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
> ---
> Changes in v2:
> - Remove dmas and dma-names from uart nodes

I'm sorry that I did not spot it before the patches landed linux-next.
But v1 does not have dmas and dma-names for uart nodes at all. From what
I can see, v1 is all right, and it looks like the v2 rebase moved some
hunks to the sibling UART nodes (identical context). The QCOM_GPI_SPI
channels of SE 0-3, 7, 8, 11 and 12 sit in the uartN nodes rather than
spiN, and spi4 and spi14..spi19 have none. v3/v4 carries the issue over.

I'll send a fix for that.

Shawn

> - Link to v1: https://patch.msgid.link/20260916-nord-gpi-dts-v1-0-073e3f9c19d0@oss.qualcomm.com
