Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 31B40432BC9
	for <devicetree@vger.kernel.org>; Mon, 24 Aug 2026 13:48:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787579294; cv=none; b=ezjZ1xkjOT1nl+G6h130J5g7M708WQyiWig4Fqcm+lAuDDuQEOA6cghWdGT6QENrJQoZ1bOoRAY0aiaDhGa44FV/6Vzp7fs6vEW6xnY7HSIgJShc+XKYmhtBwXhi9vVkkhgmGVGS9ErZedoWKQgS3iQrKN2VnM6d/B1vuxfGoS8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787579294; c=relaxed/simple;
	bh=jPTF8P88E8mHV7RO8dC+Aii8EkwMv2ZEjXFtqjGARho=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=mNE0+uRf3irFhMNOFdeC0CbuTWUbDpBBJMZK2qZ77lCHB0qnPntP6Yi3qjBYJh+enOV6jcVCHfXQzuDFh2GLmC4be2yzh1T3B4vvqfs8K8AEUEIqxlCrcF8ll1Pvt4ADat6mlb6WQEelYgNeZo9IwMdK+lq+SwaCb9ueLp0C2TU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=EbIm6a/s; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=TARNO0qM; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="EbIm6a/s";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="TARNO0qM"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67OCuv374077892
	for <devicetree@vger.kernel.org>; Mon, 24 Aug 2026 13:48:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	b15DvA52PT9M26T4P/yCzlhrD5TH9G8ioAlZEP03aGk=; b=EbIm6a/s+CT8FLha
	s+1ubSks62x9IldB/DhPKDrI8XUbO6/aqHt8GVhqEQwTAcEl1s9/kgFHLY9JMt0A
	lz80jGR+/2TeuNdoJRRhmjnlf/luIM6xCqH2XMrckbObj/jo0opB25+HZZrPedsA
	zjo7u/MQr60+SVEybQ0dt763reEFz2AVNnvxZj71x41fd5Vrij6zRLBeJ0aL8AhV
	ALKn8nvRXkwn8hJBMblz/skIyV7lraEWbgvUfOb0KgQqBabw7wYkgZsi9PQnrRM7
	+P8KPAsvw9ZhNgSL4ZV0ssrsfNNbxguB5BsnkBDODVQEyJdpuutTLb+aGr/UT9DK
	wnxHjA==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g88jpk1pr-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 24 Aug 2026 13:48:12 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-51ca37ce4c3so6533141cf.3
        for <devicetree@vger.kernel.org>; Mon, 24 Aug 2026 06:48:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787579291; x=1788184091; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=b15DvA52PT9M26T4P/yCzlhrD5TH9G8ioAlZEP03aGk=;
        b=TARNO0qMI+qtwcMeMSmp3hYjUG01qp1FRCkNRuqNJHOtHFXPh7hcUQj+BNBe6WXE52
         9rg3/KvleVM1PN00wIiPqyZfVGkgu0OidTLt7ye+w6AjXqI1wgwF05hsHq1uDIl0ZuM6
         GzHEHVY/1AiD7PlADSlJjyQ+1E/EsNM9T0rIhhhzwi3eYORRB3Qo1PM0TJcPO/u7FztW
         zb2hZn387i3/ksbm23WsQ1ani91t6+B4+QqRBhReeCS3PPV1T3A2ezz7E3xdQFWm3w8C
         HuwHTlXfX5CYXM+2LGImymbIqBheCetmN8NqNb0E316gr7yrcUgxEvHKFI39KCzqlJ39
         xZ9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787579291; x=1788184091;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=b15DvA52PT9M26T4P/yCzlhrD5TH9G8ioAlZEP03aGk=;
        b=G8zdg43PqEWrhJi8ajUCf2bo09OoJwIi8ing5bxSn6W+naO2yWobXyex5f0LFlYrQI
         Ja1qelUmqEy/9sWqTm/mabrgNjXD8z6dWmnRsilEFXHDI2XZk9/jmyY+hvEIlnC+XrQB
         Oi3mFYKNZekQhbfnGA9OgoltExB9y+urhrzz7Op6jKqY8rcUf8B0EhjOkFDD27pntUSC
         yPQM93xdn9X6DBJ3EVAW9JX2LY+0YVHULguWjZxMgGwt8OrNYEBGW/I3oTPuBO5ooobY
         u5rhqUvaXk2yiJs0YwI/WOhzF3hECT9zhJix/eiz8YhMy8XIbQLnijldu6m/3sn3Jr8w
         7kzA==
X-Forwarded-Encrypted: i=1; AHgh+RpLezgp040/TRGpMf8wM28P8eZ9Jj4kecmVFNZDToMx3BFeWpPfh/4BbsT4ZVkypOBuGDzGNAnoVYfr@vger.kernel.org
X-Gm-Message-State: AFuF++nkHMp06gg86iTcBFtm74LDiiAUNsGOCHthHbfcmijBJ3MOV6Ki
	Ik/X2yPaHN6R+VNua1QneDn6RwyW9rYbP4GylpfREPZYmxZjOsrZWVNRqYypSwUeviZmZCPrJHV
	ORmW6yMLPK/NrcpM+xns/HHf8U9PKZrVDcCIZW7Wy14MzcBUHpze0W0+/kb4qs6vA
X-Gm-Gg: AR+sD11tgZv6bwB9kjbaaWUX1AhYdB4wTpnrl3wwHM90sscffkYu/CU16UFnp3jb7iS
	qE/LYamyCWoJ9gTeAfX5SvR/H/jdnga7pbtrjSeYQ//BHV6/S+m9VOJO03PkL6OjZIB7Y5JxK+C
	DRPwhfmICa0NfSFAXdBhE0xgLW5Fcy3O433NODuLhD27VYrAlP4b3/GmtOgbIdpc5b/Ic6dKcOI
	AB7Z0C7khEPe/IprPEum48OshAQqo5Uihjvq9+hFi0TbBPwmaklrwsrrZB86+h6rMeMIF17+uGu
	Yk1H4BZVFz8S99Kbr3A1gD+7vC4fafc4WHlVupON7nB1ecOW06+6Kd3P62mrbLbXlLIOab1Ptw+
	9vifMZOl+vQd9qkQOxkzDByy2
X-Received: by 2002:a05:622a:607:b0:52d:9a83:419d with SMTP id d75a77b69052e-52df54d7275mr186253231cf.0.1787579291203;
        Mon, 24 Aug 2026 06:48:11 -0700 (PDT)
X-Received: by 2002:a05:622a:607:b0:52d:9a83:419d with SMTP id d75a77b69052e-52df54d7275mr186252191cf.0.1787579290378;
        Mon, 24 Aug 2026 06:48:10 -0700 (PDT)
Received: from [192.168.120.193] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c2496295627sm1224564966b.15.2026.08.24.06.48.07
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 24 Aug 2026 06:48:09 -0700 (PDT)
Message-ID: <906db71e-8f2d-4ab8-856d-915ff9dfef77@oss.qualcomm.com>
Date: Mon, 24 Aug 2026 15:48:07 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 8/9] arm64: dts: qcom: kodiak: Describe EUD UTMI path
 using child node
To: Elson Serrao <elson.serrao@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Peter Chen
 <peter.chen@kernel.org>, Rob Herring <robh@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260811213610.2956147-1-elson.serrao@oss.qualcomm.com>
 <20260811213610.2956147-9-elson.serrao@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260811213610.2956147-9-elson.serrao@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODI0MDExNiBTYWx0ZWRfX8BM3+bAm2qDs
 4AHHdcD8ll3ZYKTCaXz1Bnht8kgOCqHvCnHbRhU2rZnvvb1xUrY0hzalb/nqwJMJpFVYNJSioLY
 jlT2o8a6Dq9HIzIIJW8wGBDqNM5838kDstDI1M05/jZnjBnGkwDhcZjtZ/fIobyqOmf6XRg8iy/
 2JNXN0uSEYAVMe6nwiTsx1jMpILgUKQ7NnNv2p1f6ylUXqm6XHBbfJj++yH2MpXBS1PwzOqtZp4
 1DnqxT4xJRQNh1Vsl0l59JGUwr4ckmW3GFTwteDr2UHSbJ3fLdt8Dl+9gds1SJufwd0YeEQ8aKU
 c+SxEq7FGw/Go3o3/TyTmJa2XcPYdFw5mjqh2r1NGs0Cpv8S5/W9AdZu0HlmdtoSWizWCPLMXW/
 +oe6rNZutZbB6l8ljg+Q/74w6gcJA6nDGdR+sdfMEXnmThvxT54RG3Y5YhJdkA/s4TBCMr+TUAe
 vysOfCojbv/Enqzalqw==
X-Proofpoint-GUID: 5tA_fbiyg7Tp987Xye8P3dx_yI4ldI3I
X-Proofpoint-Spam-Info: AW1haW4tMjYwODI0MDExNiBTYWx0ZWRfX6Jg6grQfnH4w
 gFe9tJp3C1boVlhpSDQwpc2UFYasVZ8aAvIS1UqykRDYLGnmhpo3okvK5R3j+fTXHsOeMqS4BZj
 AC9Cbx+2XCHTHm2RXUJvfBlKoUE1efc=
X-Authority-Analysis: v=2.4 cv=Xey5Co55 c=1 sm=1 tr=0 ts=6a8c4b9c cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=wmH-f_HW3IgFKAUD-FUA:9 a=QEXdDO2ut3YA:10 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-ORIG-GUID: 5tA_fbiyg7Tp987Xye8P3dx_yI4ldI3I
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-24_04,2026-08-24_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 adultscore=0 impostorscore=0 spamscore=0
 lowpriorityscore=0 malwarescore=0 phishscore=0 clxscore=1015 bulkscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2608240116

On 8/11/26 11:36 PM, Elson Serrao wrote:
> The existing EUD description uses a legacy single-path representation
> that assumes uniform UTMI routing. This was sufficient for minimal
> configurations where the USB port operated only in device mode and role
> switching was not considered.

[...]

> +				ports {
> +					#address-cells = <1>;
> +					#size-cells = <0>;
> +
> +					port@0 {
> +						reg = <0>;
> +						eud_usb: endpoint {
> +							remote-endpoint = <&usb_1_dwc3_hs>;

This change alone will trip "connection is not bi-directional" warnings,
as board DTs override that endpoint already


> +						};
> +					};
> +
> +					port@1 {
> +						reg = <1>;
> +						eud_con: endpoint {

Let's keep an \n between the last property and the following subnodes
(like you did in the below hunk)

Konrad

> +						};
>  					};
>  				};
>  			};
> @@ -4989,6 +4995,7 @@ port@0 {
>  					reg = <0>;
>  
>  					usb_1_dwc3_hs: endpoint {
> +						remote-endpoint = <&eud_usb>;
>  					};
>  				};
>  
