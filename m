Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 715B0285058
	for <devicetree@vger.kernel.org>; Thu, 27 Aug 2026 04:00:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=205.220.168.131
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787803225; cv=pass; b=Y3I242wB7yJLOtGwOT5fmMBNjX5IudccoMccFWLP+jWU4FBaV7G+my+RdW2QR24ifaM239vriZ2QY1Hw1/aHvkXu/M97MPpSMb4k0VnBZkfleWKrVUziuknI0g+Nf8jmMgre0yI2n3zYXoJQTZvYFzhAR48GmS5d5IPo8zhsXMc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787803225; c=relaxed/simple;
	bh=oxkYlzhhuag4na2JWsclWG8wKntLbGrO1jgX1/Z8KNc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=qBu5Ajp6gPdo013BI3Q//QQ/yCxfBHhxeW+MYOUwxv7ybhUBMhJZt8Se5uE1H4BERpeJJiWFDNsUr3QZOrkTlupAdEzJyhjCpihPJJ/BovKLb2GF+yoUwb1JiFfesFOMy5BdQlg4lzOfjIUHCFpcuqv8sxDzaGqRwf7lYJpbA3U=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=JzRmdEjS; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=RtJGRTaY; arc=pass smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="JzRmdEjS";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="RtJGRTaY"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67R3J0mv1740613
	for <devicetree@vger.kernel.org>; Thu, 27 Aug 2026 04:00:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	0BNR9IyKP17sfWdf/ApxRjJuSKp7XlqeCgiYbOHvCpg=; b=JzRmdEjSWbYhMJAP
	28tOehxuOJD3K4yGSPqxv0LdFqXkMtvZOB23dB/K31xMt7Pv2TA47vpzTgKU7Ezc
	Iq6OmQwp9PjkbDMIby8/ALPpdXBQcnMNalhZudHuzqKgu8Ui8z5zM5ddg5SR8pQg
	RbkP70O/dmvtcu7d/rTsRfVNmLDM6Xvu0v+iuhox2Q4LVtqpNB8QSfnzX+9Eph6t
	qWzBN4p26S2PvFR08DOH96lKGIwfx0XaRrAM+GEfapQN1G1W7n3915+/rEt36x+K
	vqwfehXcuXONIixlxDzuliiaizOLU7Y6R026AVEcSeggZogs1wHXx1ADTOIleidu
	a/zAvw==
Received: from mail-yw1-f197.google.com (mail-yw1-f197.google.com [209.85.128.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gab7t0fw4-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 27 Aug 2026 04:00:23 +0000 (GMT)
Received: by mail-yw1-f197.google.com with SMTP id 00721157ae682-85b946f1c13so7724097b3.1
        for <devicetree@vger.kernel.org>; Wed, 26 Aug 2026 21:00:23 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1787803222; cv=none;
        d=google.com; s=arc-20260327;
        b=I67FclHaitTYCeRQ1uE+/8mau2S4s9oAEf4gyr0DgDIu6RzqQDq0mNk+q/EGOnqWB9
         SFENeB4DEekcNhCsoKG4QtmtWfHjMg5Bp4VDd65HEkmnR//vUBoPi9zqEItXYOtFg4Oh
         e9BCA0cJryHJ+wkwJ0pqmt9VNnVaiiQef5f4xqPqsB/asfg/HNhd0eGI1osTPtOMCM8h
         MCXhWDLdgSbjxvAbz+ZkFE6xmb+KpAqxYMRkOfPzMYOYA9S4YuDKiuSDGphhGON2cYJQ
         gael/e+Hltg3qWOFJ+y0rZO2Em02zCZpZrXdiRZhIBBuzBddPH2XUQpIAK2RTqrZind5
         rHbQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=0BNR9IyKP17sfWdf/ApxRjJuSKp7XlqeCgiYbOHvCpg=;
        fh=j1oyES1+tItxOTDKfIHTBAb8FvVTexbELPpVWc63TyA=;
        b=ju20+ozrb32oSVQsY2ZJpmam9d1OtA4m+GcrDXl5Nl6yXiC9HdyKxmW113RSsPqC3v
         GAI38q5nV6BjQjJreAclVKY7CmSzawn+Hs9/wao2uIGeMpareSd8f8XmmqziUIVtCFf2
         sxrVHDmY0BjLk3RMVJat40kvUg7YTOzLfXcRTfYSVN5xkLcT1+pD/b+dbVfz683TyEYg
         hqgiE4WMj6B1V31ma6MHKS/83PSQj5Q0RX36/vzw423BwaZvrnUJpKpDZj3Tr1WYKLSK
         gmbQ7VR6S63fdx3mezMPHT+i0vucmqaq0/YKRVmD3Fc3YINLhfnKXvo9/TiHC+HWzDEq
         7NZg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787803222; x=1788408022; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=0BNR9IyKP17sfWdf/ApxRjJuSKp7XlqeCgiYbOHvCpg=;
        b=RtJGRTaYBa+MHc5N6c8i8KAzGCcr5ETGlzt6HAAdv8F2BBXRvJP30gLixJ4+AlEpDZ
         NUI3ZPbP8HjslKYvBxlVhQdGUSccx3NOwXgQU/iw4HLcsUA0+hrE+L5Y33EvgGRWTyxk
         S39SQb9xakqaN5JwLEox+ZM9RYoUsN7XDCokZmjJtwmWqrwyPdR3Yhj4alvAbF8v2ddI
         uObet1B5ehVSCdUFv9Nuk4BLo5IQP/9ZFlhMx3iEbQw0DBOTEIyEGqI4aHbt3e2thklT
         1y64b83UOuhzBIau8n3PKLUYlMPDE0OvYxGuubcnlDGmslhEh7qX0/TnqfJrfDyJb4jI
         ELmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787803222; x=1788408022;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=0BNR9IyKP17sfWdf/ApxRjJuSKp7XlqeCgiYbOHvCpg=;
        b=h7EoJqiFlJmHWRIZptBdhBXF+sw32LcGWrtvtjbeYbuwiP7rZ6CVlvijEBmj4YybZa
         lMEwyHlKi74lf9twL9iHechRPvxAuxigBRzM1lVih0MikrFLG8ULq2KcQN8JymWGybXC
         qTcOpRx1DjRR4maTYzRSvUXUnrnmtIAStGAJJCwnliy4MYSnvmnlkCW1QXLBXKQI8XEb
         FYPPe6ntyGFcrfpJZB4zpBy/LB7ztl9rDEU9WXW/YFehHYVof50hxQ9WpJPTQ1gSbkSj
         +uIFnS7fSpimgo3RhSf5kIqFD6iS8Ulqo1HoMdDmdlv1aG4yXHmfHkiH8DOrKFENQueL
         BHRA==
X-Forwarded-Encrypted: i=1; AHgh+RocSZrEcjPt/khJg1HMRLCzHa/ff1nQx06/5Ae/x1C28eXPzHreXXRVynSVS+0hzy20i5DeG+YGzXD0@vger.kernel.org
X-Gm-Message-State: AFuF++lmOlrNR0VLDI8uZ3Vg7SHEmbI7EmS9mzUYPan14bMIHj8miKKG
	sGCWRzQCwcPnpxAz9fFvlEmzR61x52FbqVJq6WsdnAQOjRFGA9tPM6ZJVgn+tF9kjZcbv4/L/zz
	xiXEvVXtCdnQ+A+Vew7lW17Uj4KvIpXpy8SD5+h7bfnqlxrLwZLyJHkBwAqWuZ5pI8TO0IIusnb
	r9rKAS5AyroSlrbYAgs/t0lSw9Or4YL95B3QuApH4=
X-Gm-Gg: AR+sD12RHHALjD4TzdRefF+rgLPGCNLpXMbCSNb//OJebG3BPBXmK/KGG3t+I+zwabx
	DNQ4ZiCPIk+k+BIsz0ZzM5iCAGwOAwNDA4kE1MFPW/BBQZ+6bvEC1rL3VY/A1Q2ILTTyaKabUBw
	DGm0rpPn1tJ1GbKY3k7wI7G67RxUF8cDueYt17c3oSMxaDE2go5P10kQ2LzQ==
X-Received: by 2002:a05:690e:111:b0:66d:7b7:e36c with SMTP id 956f58d0204a3-66d257eba9amr3248395d50.48.1787803222436;
        Wed, 26 Aug 2026 21:00:22 -0700 (PDT)
X-Received: by 2002:a05:690e:111:b0:66d:7b7:e36c with SMTP id
 956f58d0204a3-66d257eba9amr3248376d50.48.1787803222014; Wed, 26 Aug 2026
 21:00:22 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260824063627.3595610-1-harendra.gautam@oss.qualcomm.com>
 <20260824063627.3595610-2-harendra.gautam@oss.qualcomm.com>
 <bf6e42b4-ff21-4b6c-a7d5-024e5b9a7da4@oss.qualcomm.com> <d59bd8cc-8b88-4529-8a3c-45358f9ba6c1@sirena.org.uk>
In-Reply-To: <d59bd8cc-8b88-4529-8a3c-45358f9ba6c1@sirena.org.uk>
From: Harendra Gautam <harendra.gautam@oss.qualcomm.com>
Date: Thu, 27 Aug 2026 09:30:13 +0530
X-Gm-Features: AcwNN1VxELkZrglEk7cAJOduQPXP1zIrNjAfvcnJwAH-yznopOZrFR-Fw-ookJg
Message-ID: <CAC-tS8AfsCT+CY44EDQ17NUkhuPX8xT1tA=Soi+UwP6+HRoupQ@mail.gmail.com>
Subject: Re: [PATCH v3 1/9] ASoC: dt-bindings: qcom,qaif-cpu: Add binding
To: Mark Brown <broonie@kernel.org>
Cc: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>,
        Srinivas Kandagatla <srini@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Jaroslav Kysela <perex@perex.cz>,
        Takashi Iwai <tiwai@suse.com>, linux-sound@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Prasad Kumpatla <prasad.kumpatla@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
        Sarath Ganapathiraju <sarath.ganapathiraju@oss.qualcomm.com>,
        Kumar Anurag Singh <kumar.singh@oss.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Authority-Analysis: v=2.4 cv=X6Bi7mTe c=1 sm=1 tr=0 ts=6a8fb657 cx=c_pps
 a=0mLRTIufkjop4KoA/9S1MA==:117 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=DJpcGTmdVt4CTyJn9g5Z:22 a=VwQbUJbxAAAA:8 a=5jftPqpqXhJRGXY4JksA:9
 a=QEXdDO2ut3YA:10 a=zZCYzV9kfG8A:10 a=WgItmB6HBUc_1uVUp3mg:22
X-Proofpoint-ORIG-GUID: zH-Vv1wAKzEjMQ867cQoDzhJdXz4HeNN
X-Proofpoint-Spam-Info: AW1haW4tMjYwODI3MDAyOSBTYWx0ZWRfX36+RUrHBMWdK
 FomOx3l0maLNkkqL6VceJh6DSlW0DigDvKtwb0/9Lid7sw5Y9qG64Zpw2GhV6lyHMrTNQNAG4d2
 3LFWIkfeleoPjrAxk9lGXTsi3DJO87c=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODI3MDAyOSBTYWx0ZWRfX07OmpF6Ce0ck
 In06mFZ1GBCzo/PPP++SS1rAcymi1KPvtja8xYv6ME8WcC5KInE8gDvXk+L8vtyrY7/fc5SKo89
 OxMN2l4MpuhW87nITroMTlKWbPlxUvk0X39Gvq2Ukr65S3CQD3o11a+MJJf/E8AxgMyrgVAxhho
 /zTe8XT6McczqVdZcyF3lQTgDno9xmYHfqw6E2/abc3DkK3mmcvfHUuG6dTewVY4GUmIQrykmbQ
 wCMtOH5+IAWyHhu5ewr7rVuC0+QPArF79XxuFhXqMhENrqWCscyywRAg/jqeqjpwwSofLQX6I0V
 iOY1+F1ITxTlsikezjXMJ4qMHLvcAm83AxiZ48b8zreqjB72231kEmdjArxl9sBh7una3WFGrKM
 O/qWg6RwYVy2H9EqVwO8efC3gkIle4A1ar1cesGMRN6DNB3O1wW6DvyNKoNEjEZyWDFkAkPFYD5
 n/EiJfLfYjX+S0ipDTQ==
X-Proofpoint-GUID: zH-Vv1wAKzEjMQ867cQoDzhJdXz4HeNN
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-27_02,2026-08-26_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 bulkscore=0 impostorscore=0 adultscore=0 clxscore=1015
 priorityscore=1501 suspectscore=0 spamscore=0 phishscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608270029

On Thu, Aug 27, 2026 at 5:02=E2=80=AFAM Mark Brown <broonie@kernel.org> wro=
te:
>
> On Wed, Aug 26, 2026 at 02:01:52PM +0530, Mohammad Rafi Shaik wrote:
> >
> >
> > On 8/24/2026 12:06 PM, Harendra Gautam wrote:
> > > QAIF routes audio between system memory, external PCM/TDM/MI2S serial
> > > interfaces and the internal Bolero/WCD codec. Platform Devicetree fil=
es
> > > need a binding to describe the controller resources, DAI cells and pe=
r-
> > > interface AIF configuration, and named constants to avoid raw numeric=
 IDs
> > > in sound-dai references and child-node reg values.
>
> Please delete unneeded context from mails when replying.  Doing this
> makes it much easier to find your reply in the message, helping ensure
> it won't be missed by people scrolling through the irrelevant quoted
> material.
Thanks for your suggestion, Will keep it in mind next time.
-Harendra
