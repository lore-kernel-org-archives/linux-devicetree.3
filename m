Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EC20148E0D4
	for <devicetree@vger.kernel.org>; Mon, 19 Oct 2026 11:40:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792410022; cv=none; b=I+sX0EMD0ExbvAVntQjiLpyy/OjSpKeVA5YJJ9Ky+uHzTQSWSKmdgmTE8TLWaTDUrj0g/mEVWiTJzPfWNcCBkmUW1uSsRbtGtxaR444Kr+t1y0PBkrk0MNdpT7ERWG2sd6aIAG8eeq88vamYsW1LjJOwm7Uk/beA8f9zfsKQJvE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792410022; c=relaxed/simple;
	bh=zNa6hjnbJsZirNp2D6itt1WLH37BdWd7BIdoXDU6qOY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=sLydcyNh+RdmsJ65rfMQWe2I9f6clQbCKTmYfKnkPLENiDUr5f80wEMjFyMQ5SpVsHDtjkan57ClcIVc35eAWUw0vqNVTW0CD2EvxZT4XtrxMO7g1F72Goli1olEWM3rl2EaMYVXZfC3+jPVHcTTHV//gjOfJdV4E+MkzV9twYo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=b0qske6Y; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=EDQbixxJ; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="b0qske6Y";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="EDQbixxJ"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69J8Os0K1168036
	for <devicetree@vger.kernel.org>; Mon, 19 Oct 2026 11:40:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=IqIT7unUNeDVbUGIwzQRnFuw
	+MAaKeTUmeCgf8MNO6I=; b=b0qske6YXg+7km4y82nPrdnSjk/9jGB8dE2zAfS2
	aLdB2rwbp9/1KnLBds4r2l+TrTfOr0U2KAQr2xmzeLUMdUyF2/jWc/jzV2W/Kzk1
	MtUZqw//2uZv88Ml9ugxhsStIbmxF22YsG21P7WFiHCPcXOx5sKcKQgO+9SZqewA
	Nn9U5MxRg+2/s3jR73PD5JiMN7wGp5myf7+uj7UvOlcx+8Jine2wHPRi1OIIzv5o
	HDwZfAfu8RHnZTzOeU/78hxlJnQnc9tUb76eQE7DRNM3yaeO6PY6HP03SIfEdORN
	Z0W+8/fHeQ3IvKkWvCw1PCqKIIktBR/PKTyWevAi2Ib5rg==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hdf5c8v2v-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 19 Oct 2026 11:40:19 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-93f33438950so462445785a.1
        for <devicetree@vger.kernel.org>; Mon, 19 Oct 2026 04:40:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792410019; x=1793014819; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=IqIT7unUNeDVbUGIwzQRnFuw+MAaKeTUmeCgf8MNO6I=;
        b=EDQbixxJ0NfTXTz7U+4qvABrqvUor5sanbWa0DR/E+8gPR3poqnx8Wdgz9lWq+g42R
         t3jdLH1nSenRiBJ4HOnH1VbzwsfHAhKx3apt2+zQtHSZlYCTIlqDTp9x07HuY19N6BYp
         qMIMgu5iBC07+0/cXDZhNC2kOo+7Ag0FSdNpjkwJUWvqmo5pHNeYpoFmgxrCcwaGUj7n
         niBkZpnsubaOVkk2zk8bDI664ZGJG4zqN8QRo4HLxcV7rPNCyCIWNGYJuDFxmKXQZvp1
         kvMdmu0pEV+995FCdPF6+6GxsNK78ki5opgFJxt+Sel1iGX5jdjHzkb/EmP59VHEuWQK
         Hk7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792410019; x=1793014819;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=IqIT7unUNeDVbUGIwzQRnFuw+MAaKeTUmeCgf8MNO6I=;
        b=zCJKPyJDtLJKXH6A9dNWKbI71ZibvFYEDuPfLNUfXddssZSj1NZFj/hwMNB/up7Pl5
         8RK3smq/WWHufRu14P6eLDqPHSkFBJcRDjB8L0o0r7e2V0OnEGpR6xcVzDnYbdNHpArw
         1C1OIdvLQx+ej2C8Jx4+IBiaU0Zle5SBI/Y6AwSLIh4r2Nbpmn+NOkmkHHrHNiQ2of9T
         eXqitPs6z98L6C6wa/GfKOAZAZqu4wlE75hrNisAnfKbB/pm3AWvKfT17AQ86afa1JkU
         7a7v23UL/Gw+oDAp1QuFDlDvEpX3+umf2xycHJywNwZmJiQmhu2sTECJxC1Mge/WId54
         uVvg==
X-Forwarded-Encrypted: i=1; AKwUvBxtMDQ0tEO+zCYUR3wecBItZIDYfA+Qp+dxGZdjR27euWVPzikAuakeqg4Nwl9gLcO5TmUhVhEHLSCx@vger.kernel.org
X-Gm-Message-State: AFq9FYLeYazzlRW9TJQvmoKUHv7drxW2tzQdqKbwshb8ol08DV4VtDCL
	D32Gx15saGl3rNZKQ+KOZ/MLuUADQFxYbwCrJsCmK51ewS0cDWDVdBFQBp5TvyMXAuDzah+Iq83
	ss403T+23pTv3WEUw10t4Ss4TS7wL6gu4TokL/gxku11L/INyfP5cipKR8BaycqzK
X-Gm-Gg: AYBFou3+rIHCZxnVx0IG85QVLx6PZhYBnF5elrpzyTLbuhOe64YI/j0lz77UIU3K6nl
	djQP14zchnohmUHCToFNkvPBg5Cz0ibS5S+/LOB7KfcBNnu/smTDcOX5s3EKo2Sw1huoU9+HdbC
	jSswRpUuLiDXu7No73514L7XVHyWnn8Ozo8VTyK4kZICD0DXvDBw4q8PhX3TNHpE3+k9CQDEXH4
	jZKEGr3zhugHjrv0URSzvEa551Bkg8Fq2z+oaUY6E5lPmktfYUreRzaXM/Wv//2rsZFVxPInIi6
	fYn+MmztNHStQ7V04IUc+uA6+uUoW8hFYuJowU5zzgTFR3U8cPQGIWBdcGgxD6XiFigzvQGY9LB
	q3WXHGp0mn60Lcejv
X-Received: by 2002:a05:620a:258d:b0:939:6dea:374d with SMTP id af79cd13be357-93f29d813camr1251144285a.49.1792410019007;
        Mon, 19 Oct 2026 04:40:19 -0700 (PDT)
X-Received: by 2002:a05:620a:258d:b0:939:6dea:374d with SMTP id af79cd13be357-93f29d813camr1251139485a.49.1792410018424;
        Mon, 19 Oct 2026 04:40:18 -0700 (PDT)
Received: from oss.qualcomm.com ([188.27.161.187])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a1c8a81587sm519633865e9.1.2026.10.19.04.40.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Oct 2026 04:40:17 -0700 (PDT)
Date: Mon, 19 Oct 2026 14:40:15 +0300
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Konrad Dybcio <konradybcio@kernel.org>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Hans de Goede <hansg@kernel.org>,
        Ilpo =?utf-8?B?SsOkcnZpbmVu?= <ilpo.jarvinen@linux.intel.com>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Guenter Roeck <linux@roeck-us.net>,
        Bjorn Andersson <andersson@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, platform-driver-x86@vger.kernel.org,
        linux-hwmon@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: Re: [PATCH v4 4/4] arm64: dts: qcom: glymur-zenbook-a14: Add
 Embedded Controller
Message-ID: <44vpjtmnwg7wtp6xsqgl54rbpos27fndfru7pmudfvzweyl3zo@r7dxlf74klfl>
References: <20261015-topic-asus_ec-v4-0-af6305ffcb10@oss.qualcomm.com>
 <20261015-topic-asus_ec-v4-4-af6305ffcb10@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261015-topic-asus_ec-v4-4-af6305ffcb10@oss.qualcomm.com>
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE5MDA0NiBTYWx0ZWRfXyAo6ENdWVxqu
 7EfLCt1qAoYw9OD3SzOuHZuCR3FxO2mf0UioHZnlYZSYR9smYmKHmX3ZI+pfT9ckYSpU5UJR5Yo
 yz+7Mom8X0ZPj1s0c+tjoOpCbfR4tDU=
X-Proofpoint-ORIG-GUID: Da4bmWkzMQDexcHTPH4CHqqADXCoVll5
X-Proofpoint-GUID: Da4bmWkzMQDexcHTPH4CHqqADXCoVll5
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE5MDA0NiBTYWx0ZWRfX7Lt5xdv5if7Z
 agpyAZwjqO/uhksiEq6Ks0l59WhlbKud9y3TGNNHYejLPxESxJmocYaPvKWwlHBl7QDsaTfK47K
 wyHABzcC9nuK9MK6qf97rMz6mMEcl19R2utZm1kZKNM3ua4DQvHL0ypWSA9/U7QspQuZidAl7r8
 nZF/f8tC5TI0HYiBAO8MS9eVdjf/4tTi00CKKWhVzNhDhkDGiNbNhKBuXw8n8Sa0quFFmx2UVUJ
 XqXbrfNWzGYZsLiA2qDAUTQBMP/jv0BBjFB+pyxaSlFcqj7+pLbp12oIBXvoaASQmmpeGuj/5/Z
 0idJrrJbWhGyp60IveCjOBQ7rD8qJq/J7HmyHYsaaiuqIVuQWkPeWE8ozk097yhNr+CzL8WMf1F
 QhiS1PH3x2YGmePX9vJ12GG2YAjXCqppStaNTfcWjhIhF8SJol2GbfpGENGi698XB6VF2BGJ0UD
 Kay4WoIsrIxsfQJoolw==
X-Authority-Analysis: v=2.4 cv=K6O3jCWI c=1 sm=1 tr=0 ts=6ad601a3 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=Qvngrl3H0rQgGg+94q4QgA==:17
 a=kj9zAlcOel0A:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=EUspDBNiAAAA:8 a=-FifcBtKAQNI-ioUATQA:9 a=CjuIK1q_8ugA:10
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-19_03,2026-10-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 lowpriorityscore=0 bulkscore=0 impostorscore=0 malwarescore=0
 adultscore=0 suspectscore=0 clxscore=1015 priorityscore=1501 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610190046

On 26-10-15 10:55:32, Konrad Dybcio wrote:
> From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> 
> The Glymur-based Zenbook A14 features an Embedded Controller running
> custom ASUS firmware (which is loosely based on the reference Qualcomm
> Hamoa EC one with a lot of modifications). It provides keyboard
> backlight control, additional temperature sensor readouts, fan speed
> monitoring and a number of miscellaneous functions.
> 
> Describe it.
> 
> Signed-off-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
