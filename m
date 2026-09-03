Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BFFB240B0F5
	for <devicetree@vger.kernel.org>; Thu,  3 Sep 2026 11:02:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788433342; cv=none; b=o7GkxPH3Ur+dFh5XBW1bps/1+l1btxqNWXrbvZNDep6N0vXsHoiFwb/hFqp5W58t559NZ87kdRXSQxdMaPhsS2TOxPwxf7iX6f6F4860L2VqIZokLjFrUn2jB221gmvITwJET5RsFJ0w/pC2uHnaJz+hsTV60N/xrsgOC/q2gmE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788433342; c=relaxed/simple;
	bh=YDZo9ZYZE772bcwSFVYQA0GZbNjBirUfMskrV/SyAes=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=GH0JI9Wd0o8zLD4ByWVQ6J0BELWxTTu5bcnu0Tj1xWDSk0bAAz0gYa5UdN3PJlTR9YBSxjHr6kqQSQpbFongQ1eiC9X9FPhcjKUDYhvZHk0P1dKq0uSLZnGle1pUyi/kEstJ5pema2xY3qicqLg7jzRJGlAfMZpNVQPREjc0q7E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=FwGhCqL8; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ADsxKKKt; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="FwGhCqL8";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ADsxKKKt"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 683AH5Ww935081
	for <devicetree@vger.kernel.org>; Thu, 3 Sep 2026 11:02:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=hVNPU6fgZysvc0v3TCWPIkZk
	yK6aKEYh3Zspk9Nl3dA=; b=FwGhCqL8gDoy3nnOW3pYn7MpEvH9cdUpcuicy9W4
	yu2ddue2Rl0BAB71QMNtpNLXEODgyI+KcDxPy67+wDO2laZ3NoeHmyM3PMtU0iBU
	dWWNZTfh46Tpm/NRKn490LONcWCLIhJeeGg7vVZSoCxzSZyxXMb81Wto2XLGMJJx
	ut9e+Uv4jEs4W/0c+iIETEXC1h/1fiHe+Uu14XJSG2+euq+L6QQfC7cRmsB/v+/j
	JWVoB4tkCgFCkvkUY4gyEOmDlJ1MHBh3rxy7dsTTjvWoy+6JPCkVkzPgbeenyy7M
	QS4lvlaOB422yRglPd85NZxs64uc1X/eSmQ/oOWscfTInw==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gerdnbxm6-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 03 Sep 2026 11:02:19 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-92ec3146553so620418985a.1
        for <devicetree@vger.kernel.org>; Thu, 03 Sep 2026 04:02:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788433339; x=1789038139; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=hVNPU6fgZysvc0v3TCWPIkZkyK6aKEYh3Zspk9Nl3dA=;
        b=ADsxKKKtJdyK6K0orw4QYzDdgmo1gg7IV8BrgG6H5Guqr/orflhvKu9jswibhH8649
         AhShHz4cIiOWw1NZj1Dd8LDhoD6R0pXFuQiNWtT63mXTfU5Fri74808l9OP4T8Gvoc/I
         aiiBOXL4Pas1Nz5dFPTbt9VMhZmYBG09r1NEusnJPhLecRupp817AtKhIowgLkHtHXM0
         rEoDRf6a3Tow7ggup03dPerxKrV+dkzWhRqo4L354VpJRdQWI5R0i7LHV/oqIrljNFxa
         gLX6MwLoQNZfCuOsOUZL1OSpi+9dt5CcaLmPICPzZfgfVMdueqeT6n438HTRmwyOh622
         LE8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788433339; x=1789038139;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=hVNPU6fgZysvc0v3TCWPIkZkyK6aKEYh3Zspk9Nl3dA=;
        b=hyX6taPn+9EYin6B3Ynxf2fxxu9tULtJ2GPXqLCKFB2wmrO1Ew9oOMwpulwjHNVlx8
         gVSnPW6YaAZc/q6jUM45yKNS74LFMsYJqJoCQZt1d7g7V231aXn4ksVx79xvlX1UdcsU
         yHstln03M+9jFJ6Tia2JsZc8E3VH8SvPZiqPXe3KpvZ7q4ICPQXaszBalKQrU7tS9bZ1
         jo+3bEv+uijgnu/zp6y1uJzqA4LTmI0ycaOolnc+TKpoUL+sOTr22tE0nQjD2q4XjsX4
         uQl8Jdm9m7xd6sKoPpKQr8PjI4kgyyijB/+JeSl0MYpVObYcBQki2wpxvsbkeihhSaYd
         Zltw==
X-Forwarded-Encrypted: i=1; AKwUvBy9IhYXPEHmMQ6PMeeFP25bKQ13J76HwU3ky6HrTjAX/gmPsH0DacKlIAqYHSrja1vJscHRqZM8XLR2@vger.kernel.org
X-Gm-Message-State: AFuF++kVdgXFjqbAkqsOeBDoOHHJF8t02zzn2MybzVg4tbzhNDeoXG14
	6vSewfwXoeppU+jKvXq0LmDN2PwbuQfAKjDnUXRSxtGYRL2Y36lx/XNjblvTFQ9OEUqHxveCAq/
	+TIoN25GQTIlAOWPHCZ+lT1L2vahgZT2w0dypbijTb3o43MiUXxaqXobpgS0k5lJD
X-Gm-Gg: AYBFou0ks8OTAvyeFjFlJ2DrX3mqTAfMKJl20ZxFiJ1beMxlYMZx1k1+Wn+4pHn1DvT
	ALX0yEZrkOxh44829PNT6VENgW69wPEDyx2RhjVRzo4q1KzZC+OudWzcvmPwp5csWchtAftO0vs
	HrjUi/oei6525ZGQklH8qDzDvDCRrqqHRQLHe+wqDdQMBuv20z2PAiUNBk790eTro2t1H8Mn7O8
	Oi9xoozTCkJiGbOoSFrUeHBem6jMkRBjEUoX06r6dQElqA/Me4si0Wx2hHsWvj8pXQjm3qDWSsN
	rfUFaIXb97jC0uwu89p5x9/AowzmtHT4niThfHo0aD7hrUUx+yLWY7mhuJvdjM/zWQcXsPx2acl
	LsPo+MG3gbysJ
X-Received: by 2002:a05:620a:6f9b:20b0:939:124c:b7d1 with SMTP id af79cd13be357-93960f85fafmr1094908685a.30.1788433332519;
        Thu, 03 Sep 2026 04:02:12 -0700 (PDT)
X-Received: by 2002:a05:620a:6f9b:20b0:939:124c:b7d1 with SMTP id af79cd13be357-93960f85fafmr1094899285a.30.1788433331910;
        Thu, 03 Sep 2026 04:02:11 -0700 (PDT)
Received: from oss.qualcomm.com ([86.121.170.36])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49cee5dadddsm72432615e9.9.2026.09.03.04.02.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Sep 2026 04:02:10 -0700 (PDT)
Date: Thu, 3 Sep 2026 14:02:09 +0300
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] arm64: dts: qcom: eliza-cqs-evk: Add power and volume
 keys
Message-ID: <ebhtzlovapjnznxk5qckfk2uoj3qqilm3rqq66skifm4tiep3q@euzv5r64kcky>
References: <20260824-dts-qcom-eliza-evk-add-volume-up-v1-1-0cee16886d43@oss.qualcomm.com>
 <bb5e86d2-2525-4abb-8ebf-75ba7780bbd5@oss.qualcomm.com>
 <nl4lhbhbz7i5pohlenlbnp2odqybcbgv5n6aeulh7hkhq7s5nn@7ylcarl2fkil>
 <e5292ac2-ed2c-4f9d-b74e-adafc0a77cbf@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <e5292ac2-ed2c-4f9d-b74e-adafc0a77cbf@oss.qualcomm.com>
X-Authority-Analysis: v=2.4 cv=YcmNIQRf c=1 sm=1 tr=0 ts=6a9953bb cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=q7XEBjOi5DRkXzmV0jSBjQ==:17
 a=kj9zAlcOel0A:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=dILcdvjvUJ3AZP_D2AkA:9 a=CjuIK1q_8ugA:10
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTAzMDA5NiBTYWx0ZWRfX4P9yojeQJ5MY
 P9NElHTGvz7DFKhIRi8R8z5ZKw5bzlEqSmwZgqlhsrj/mliCRk3cuMGEyuBI03zyjcxHvXtjIqD
 OlMvVHK1RhU5QfKqZqzN/vpMdQpmAno=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTAzMDA5NiBTYWx0ZWRfX372KhSicDqtQ
 V9xlTNln0BO1KKDg+KfvYWJeso/HNiEcur9MN9GiDgizUoIDU7Vz0Gcjxmq67NlpUm+VbYhnsZq
 yEamB3OzOnYF75DTk1L+0cl3rjw9m8J50urso0Kkvhn9WfrKAqxwVEpWtCsDqRr8APhnvTK/lte
 cAgwZI+XVXZ0ctUsHVbzP5zx2ixqWLAc+G51LkXZZy/tWqtgTHV1FiXXv/5PaDqmO/QhhZpGlhs
 yLkcuk5ySrmEzQugN7G7IunpWOYi2TSY0aJqsWserxmqvkyIUZmVn9YPk8LziySPEkKjiN1r2Ds
 VnZ0H6O7NlsdrnpfW+9c3XzSf2tjg3p9fm/iWJd7Z8u1qCI4b46kg2gRGERqBEbReBNls7KDE7a
 SB0Kx8VyXz2P+aSPJgX0N3pzjm85pjlfdTHn18UXeNTAVHtxzDcBH9zNlbtu8/0+tApzMervxRs
 cfoMK5h640UMZnwftrg==
X-Proofpoint-GUID: 56Ej3nm4xMRBsbKcUBjIPjiBMg3JyUhB
X-Proofpoint-ORIG-GUID: 56Ej3nm4xMRBsbKcUBjIPjiBMg3JyUhB
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-03_03,2026-09-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 malwarescore=0 priorityscore=1501 lowpriorityscore=0
 adultscore=0 phishscore=0 impostorscore=0 spamscore=0 suspectscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2609030096

On 26-09-03 09:26:29, Konrad Dybcio wrote:
> On 9/2/26 10:52 AM, Abel Vesa wrote:
> > On 26-09-02 10:30:38, Konrad Dybcio wrote:
> >> On 8/24/26 3:45 PM, Abel Vesa wrote:
> >>> The Eliza CQS EVK has three tactile switches: SYS_ON, Volume Down,
> >>> and Volume Up.
> >>>
> >>> Enable the existing PMK8550 PON power and resin keys for SYS_ON and
> >>> Volume Down. Describe Volume Up, which is connected to PM7550 GPIO6.
> >>>
> >>> Signed-off-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
> >>> ---
> >>
> >> Can this go to eliza-evk.dtsi instead?
> > 
> > They can, but what happens if the CQM variant remaps them to some
> > different gpio? I don't know what CQM looks like.
> 
> Can you find out?

Just discussed it with the HW engineer. It is the same on CQM.

So I'll move it to eliza-evk.dtsi instead.

Thanks for reviewing.

Abel
