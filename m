Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=205.220.180.131
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795513188;
	b=eo7rc0mdOvP8GXJSsd8GhoRScDeOW+vFv9+tHdtQ6ucgjWSZDlfMgHb/UgVs2sR6preY
	 C74OKN6seGMKZQitqWgXIDNK02d//4Hw5hg5l8FyFIcCqb7msPlr76Xvk4jCY82q39k8d
	 C/kAfzCjz+zPX7yIu21PHJ6JFPpwksDKOZEdy41UK0bSUuunu6piRtvc1cSX5wV60otZi
	 bSV2596Menqb44jqQe2jUx+siPNRgA66xn/t19fgnqcyvGv4kBRMA4pWFTJwiN0AEpjpB
	 dHwWhumj/vdSYers9WTND0jFH3FxJvsKsGUSF1dBhWq8f2mrvBqotH7PKq+oJ5TtJ3g==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795513188;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:MIME-Version:
	 References:In-Reply-To:From:Date:X-Gm-Features:Message-ID:Subject:To:
	 Cc:Content-Type:Content-Transfer-Encoding:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-GUID:X-Authority-Analysis:
	 X-Proofpoint-Spam-Info:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=GX67EW3QpXd2wmF3bvhni8ri2RMj3q5a7d/LeFQfIjg=;
	b=rAcIi3UzQnZNRk43P5TbL1i/awHayM/mMVfAzxOsZcHbOf6WrWCRqg2EjT0cqEnTcqju
	 YDN9BknbdK5uQHqnZAjSND8WUulSF1H0OlmZF3Qyd3MBOWpb7RjkrRS3Tv9TMKaoIt4nk
	 nFv5W3vQsT60WAItq2ZWDKNGiaS4z3ur9Mf31RYQVUYdAqdpM3CBMqLy7dVp2wVbBuuCH
	 s6QyZcv5A2EQHnJ3YP3UcsqRDKrLoyRVz9JTTKxZnEZ/BncfuaaHt2pG2lWhROi1sGP02
	 uwmjIq81koCnkg7+bdIm8NRzhOoNRhElPgb52fb420xUjCZpSTjmTrfdpAnv5P62sJw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=dTk8bDSE;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=c+GggpnO;
	arc=pass header.oldest-pass=0 smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 802D8606A6BD
	for <devicetree@vger.kernel.org>; Tue, 24 Nov 2026 09:39:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 802D8606A6BD
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=dTk8bDSE;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=c+GggpnO
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AO5mDD94136037
	for <devicetree@vger.kernel.org>; Tue, 24 Nov 2026 09:39:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	GX67EW3QpXd2wmF3bvhni8ri2RMj3q5a7d/LeFQfIjg=; b=dTk8bDSEiqxTbg3U
	oCSrJdEvIJRJSkFKq31xn8QSz8auMxz3OMom76294AEERLzHdUhss58H0lSpKtKE
	0GaaohZUnx/Bm02qtXna0C8ZvNdydTqmfOgYz5Ya4BooN2AIlE0bqVFrAUr2M09x
	WQBHSAzzCxlU2JArvfbOf0Ox0TJa8kCd/xsj9Uzb2ifO40ZhaJnSYI+tEP70a6zA
	MLkmsFiPQApe8HUCQuUGxINbSA2bXDDMhBVvw1h7NCf+9JCRZSx6LFOsX4edZAfz
	SZmzfte0A14PfJlIqWFkZdr5BYc47qJjsmfDDLW6UL8dbAJAucpUZzokS4tWxnBt
	SD+UPQ==
Received: from mail-yw1-f198.google.com (mail-yw1-f198.google.com [209.85.128.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j54rpgxvn-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 24 Nov 2026 09:39:40 +0000 (GMT)
Received: by mail-yw1-f198.google.com with SMTP id 00721157ae682-836caf085e0so57593507b3.1
        for <devicetree@vger.kernel.org>; Tue, 24 Nov 2026 01:39:40 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795513180; cv=none;
        d=google.com; s=arc-20260327;
        b=J8aipqRwUigH1H42b5akhBYry73bWPQyNOGfR6DNzAQoz2K1XWPMwm7HEAUxffZJRg
         p10thjDhmM+aJaoyWMNZ9QiTJiqE6ojmDEt/XUfodxJR+IrHYWKJ15xSNjjVC0JrGCIP
         UZahRljvyqJmD1JzdLFLk+TU5jIT6fq7sE4wxdjuDHWuiOM2dISUrRmEI4Mg8JvQ08En
         MHrZ8Izxd+AO8q/3dHH1su52uzOvlHionIdFtmDg0CZuRgIl/DJ2aVor9n49d5+agEx8
         PpMEVpwU0+IcolyJNxabG4rN/pzSPVkPalsMhPr+FS3oqzZSMWL9hVazWhv7p+t2b7KY
         H82Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=GX67EW3QpXd2wmF3bvhni8ri2RMj3q5a7d/LeFQfIjg=;
        fh=NpaBb6ogPjkRslLyQdcExYIfgszneyTvZjnfnv8k4oo=;
        b=JVzfKjQmY4iIgkOQqksgUQTZzSMDh5UzO5ZGXRJ5UtvXIQ9DXENSSBRRqEzjc7bLUn
         YXKM6MJj0v9HCzxqL6UDnjvzDoiruvNtMgAQEMMHTc3LjeWmhl/qGMnNWkwCp3K5gKUT
         xDyoF8Rl89/NllnpID1RotxlIPJofcY2aXQgrgrS5NSn7MoRODaeVs+q1137dEHvJGK/
         9+ysqAjdSW6ZCt40DPoHqJ9iukYXl75yyLpht8Uvrt+EvkfVHHH+D2CBl0IYQJG+Rreb
         rkMhce5mUzNyxo1FCICLCfdyhEpuP/elr8bdxz0Jn7yPeSU6QAAB1TKXW0onf1BPkeMm
         ug3Q==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795513180; x=1796117980; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=GX67EW3QpXd2wmF3bvhni8ri2RMj3q5a7d/LeFQfIjg=;
        b=c+GggpnOrQYfUG0m9FuZ5n3FAct/57Kfq0QyeMTRCxO/JklwUEVRanh0WWu3kYdS82
         e9Y+WLGPjuRmxAm7yUpjBZ7y7H/rkfT+ejagKzIPb15A78OH7BegVBDEtNG/TuDb8Yk8
         5tPM7ZC0Kkp0UQntIOmbfUFPB2aev6mqILJsFV5mmj2mpD5q/2w8FcS9BjfqlaFxyoRb
         SdZOs0rrN6V0BbKflQ4nYecvfas5O5v50waU/3mCx0klXYKX6zKcb1WTj+Gk4MBvss9o
         qAxXLrbrHJHlGHL5kTfawDGYoImFi0S+sD+EOoSFf4pvkHvlm/0c6AfLBJJGQE65IcHs
         VaUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795513180; x=1796117980;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=GX67EW3QpXd2wmF3bvhni8ri2RMj3q5a7d/LeFQfIjg=;
        b=MflDxwsdhe3gp3NGqK4g920IwhbApU7f1qLlWVgSj+picIExUuGFH6LPEWfHAtgnXS
         ctIo5mwv4YaFEaAkaIrSQbZLgRNSt145iGKdTt8jBgE5kx7HkotV4PQhd3WprlsOu5TV
         IASa5pzrNb7YNraK8f/BtiS+KIRVf+blFyr06T7HpIYE9RBLYMyJNo8vCPCu3Cael9GF
         AzLokivDkocCIs5sHx+2Z+Xgs0jhErlL+QNrkKsuYgtXxlPPZoCU+tBruqWFkOJUY3LY
         HVSqaDeOlit1sMIij5V/yQvN1B1nYXE0OVC5E+E+/35JoCNFr1r620hpO/zIzmOHraiB
         Bkjg==
X-Forwarded-Encrypted: i=1; AL+hErG3x7uuG7kJIzCVs/uCB+czFhguwzz6ophDJO93KOP42vyMeE8hTxKXU5wOdmsRYDt3z+Yko+k8+LHm@vger.kernel.org
X-Gm-Message-State: APuU4Z813TQ9FFGUeH+eCbOLr0d4TvE+EVoxYxkm1ZRmYB3UnVOpIHkF
	5diTT5QR3vcpp3bkNwXmPnzHegCqLqdHc6w2OR+O0U02vrEpTnXO/8croDTxrSWo+E6k56u/zbB
	nBHZ4QPIu1IR4HliIhlMF7JisBfFAggUmwTwcC7rV7kemdX1IEYowJQ6pAahiI88ws4zgC6XePg
	a7KBox1LHWQBxbTdWd+QMl7T+u6D1gEhAIS4yjXI8=
X-Gm-Gg: AZFdTZexmJryw/2c8vi0fBTJY+5fDI3c+cmof+pZgmx2tlVd2swbCROyulF3eWrji6W
	4sRzsJJDYqstczqAMYHGTnzlN5NWJnlFonccitNEfXMsUzj87TP7/JEroo5SLjkh9RUGIi3/70D
	Quq+5ZB1sNde8j9k6b8BRIq0HNq665BirK2IEcO2/utyWQjLTJID1GpS4=
X-Received: by 2002:a05:690c:9a8f:b0:8b3:17fc:1066 with SMTP id 00721157ae682-8b5204e150amr61751777b3.44.1795513179494;
        Tue, 24 Nov 2026 01:39:39 -0800 (PST)
X-Received: by 2002:a05:690c:9a8f:b0:8b3:17fc:1066 with SMTP id
 00721157ae682-8b5204e150amr61751737b3.44.1795513179141; Tue, 24 Nov 2026
 01:39:39 -0800 (PST)
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261123-qcm2290-eud-v2-0-9bfc432dee07@oss.qualcomm.com>
 <20261123-qcm2290-eud-v2-4-9bfc432dee07@oss.qualcomm.com> <ba76dc4c-f8d7-4d7e-a9d4-c2de88e9a9b3@kernel.org>
In-Reply-To: <ba76dc4c-f8d7-4d7e-a9d4-c2de88e9a9b3@kernel.org>
From: Igor Opaniuk <igor.opaniuk@oss.qualcomm.com>
Date: Tue, 24 Nov 2026 10:39:28 +0100
X-Gm-Features: Aa3M54r9dlpa1zHkZUYs8QQIpfUY7qTgP8CTQlWBurbJeaYxxsFl26_dQcCj_Yg
Message-ID: <CAPzfCAYSMpReEtrendxOHPtQRCEf-9UN--MywjS+f=7OOU4HXA@mail.gmail.com>
Subject: Re: [PATCH v2 4/5] arm64: dts: qcom: agatti: add the Embedded USB Debugger
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Souradeep Chowdhury <quic_schowdhu@quicinc.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org,
        Elson Serrao <elson.serrao@oss.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI0MDAzNiBTYWx0ZWRfXzr8lOibDWuai
 efevJh+eWXc+zDzpYU9z5+z5zKA46waIf6Thh4hdFMjsvYF7S6knn108kIaq+5JfgHRYRYCIToK
 Wkb6cjoBWXZcvSAlXcTF9OOhMa+whlTJ+NwFIzYaEwDxQ79gBEiPQdUA7rrjPhMskTxYmiQG4lj
 NcjysLfWoQB30U0anN4up5Gkf0DNUuqPt3gQgVxT3T1ss2vcuwCvOItINPQsn+BlU2wmvwmiMYJ
 AjYU3WSXpl2p18e/A4TK0MSzUmOjqVlzX75LOJQwsYLySczAN47IvwBM6o9Yar5Zt9XR0jy00q+
 GT5FAa51Y/rg+7GzFXO5yGBqbdWeO7SauysrIsMD2M+O06pWmG5wbFFZ9aM7ngktV8ESey2Pkj0
 KScwhGKEkq+cuJIlK8s8zlxADLKLsU5jrqDxJNp2p6fZndstiX7NCiEjF+YM6fbdxcaKn393h7o
 nIDLxhBBhmuHJbyk9HA==
X-Proofpoint-GUID: zGXUzqkLwafDQUWQeaoP-zwj1OjrQYJv
X-Authority-Analysis: v=2.4 cv=MvbHeGae c=1 sm=1 tr=0 ts=6b055b5d cx=c_pps
 a=g1v0Z557R90hA0UpD/5Yag==:117 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=yx91gb_oNiZeI1HMLzn7:22 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8
 a=rs2CXmWTE79dq6mJqzAA:9 a=QEXdDO2ut3YA:10 a=MFSWADHSvvjO3QEy5MdX:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI0MDAzNiBTYWx0ZWRfX1Kn5XEKZtrhU
 /G3l7GcvVQ6sYJ+g2eDB89S8RmYyo/ADBTdPfHnS1E/hoRxhb8tjSwxIatqbLppx8uohhqt6kGX
 b3Dzej6ahHxHdmxTap0BIlmVSUeHvlU=
X-Proofpoint-ORIG-GUID: zGXUzqkLwafDQUWQeaoP-zwj1OjrQYJv
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-24_01,2026-11-23_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 phishscore=0 lowpriorityscore=0 bulkscore=0 adultscore=0
 clxscore=1015 impostorscore=0 suspectscore=0 malwarescore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611240036

Hi Krzysztof,

On Tue, Nov 24, 2026 at 7:37=E2=80=AFAM Krzysztof Kozlowski <krzk@kernel.or=
g> wrote:
>
> On 23/11/2026 17:42, Igor Opaniuk wrote:
> > Describe the EUD:
> >
> > - its CSRs at 0x1610000 and the mode manager register at 0x1612000;
> > - TCSR_APSS_SPARE_REG1 (0x3e5018), as offset 0x25018 into the TCSR
> >   syscon;
> > - its interrupt (eud_int[1], GIC SPI 189).
> >
> > Hook its port to a second endpoint of the dwc3 high-speed port so the
> > driver finds the role switch, while the board keeps the first endpoint
> > for its connector.
> >
> > Signed-off-by: Igor Opaniuk <igor.opaniuk@oss.qualcomm.com>
> > ---
>
> USB parts in this patchset grew here, so now DTS must be split:

Will do in v3, thanks!

>
> DTS cannot be combined in this patchset and must be split. Don't mix
> patches from independent subsystems when you send something explicitly
> targeting only one subsystem.
> See also: Documentation/devicetree/bindings/submitting-patches.rst
>
>
> Best regards,
> Krzysztof

Best regards,
Igor
