Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 264ED35838F
	for <devicetree@vger.kernel.org>; Wed, 25 Mar 2026 06:43:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774420990; cv=none; b=Ovcg4B+wxavDaFRJ3dqLxbG4C+iClY0nrjEtLGOQdXITNgbJEqMt1JLrRwP3mfhDoTbTr79t9dQUzcbQcmR8gjNKdOvj35IyHYfk0rDNrMEMfUJRwxtfuSsQqSHgTig4jL61gZeZjkObdzoG4Vn0UKrfov9/ixpcSv0Rfnq0DV4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774420990; c=relaxed/simple;
	bh=JasCI1yX7osRLkToT6GCE4aF7otUG3SV9cx5LFSW8ys=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=C0Zxltt9M17oBLtSY3XMykWW0qWfeRgylc3H0B6e50l/K4zsKm3KkWD883WTjjhWgpX3gXze5Cb1sm+WdM7k/13OLaQDxnQcIcsvDE6MXMt9atpqSM6zlgKbWSfCx8FvJwpw8GNXZRWssZ0B5MBh+JUQiJrgEFMHzaXCwas1OM8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=O6vqYvGt; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=RPMKGCe2; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="O6vqYvGt";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="RPMKGCe2"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62OMeeLX2276792
	for <devicetree@vger.kernel.org>; Wed, 25 Mar 2026 06:43:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	iprtSxBJOHuVEk2TVxztxYPzYegRSDoPkW6NGohZoQc=; b=O6vqYvGtcrBwHtRC
	6JDVWOa5Ge4cwaZaQBWu85+lng87ig+ij8Yk/wXE/9StrMKB568LuhRwxT4zG9Gn
	HJWAd3com5sUcU/24IPZsllfaeU3aWVqclbg26Q3gz5W152RwXkvZRGFxbOUYXDT
	thZ8i4vdAfmhWFnDtwGIULT0I92Rtff7/ZT4zV9hI+XplfNh4MKXPpHJIZpjw0/6
	aImytVF3yGv1KjrLUxplwIxlQegxSqO8KI7SLrgxanrZJb7w13EYJOBU8X3xwrwQ
	xE/ClIZavJOLtsYBpFJ9zdtJoRKBapHCAMtYX9eQjJuCRNNdZTQiLFnDBJ1qfjIV
	bsHRZg==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d40rassnb-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 25 Mar 2026 06:43:08 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-35c0e84914aso179266a91.1
        for <devicetree@vger.kernel.org>; Tue, 24 Mar 2026 23:43:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774420987; x=1775025787; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=iprtSxBJOHuVEk2TVxztxYPzYegRSDoPkW6NGohZoQc=;
        b=RPMKGCe27kdvcahKPWiaKgEFKA/wuxDv6DGLW34G/M9tjJxc4RvLNdjErr62pyj/vD
         OG6oW0V04oOFmu+doYKqa38iDQLvVBdTMuIe0BRzDjlTOPcByuxBVjhpAwyGhzcyv4Tf
         Gj1MHXGM3iRK20zyxIj64BDt6A/1pySjFYTK0jDcJ+gB1SWhJEkVYDaz4EIRbTJjl8Tr
         R3rMeOWfji67gZcCgsXjkTHnS0eSVMYUKh9LOxzat4Fg4E3udLGBzpGZGX5QIe+uqiz2
         s0ve6c3K3D873g+iGYS8e7hfIpbclPYnoEOlWuTMNmmwvc+bpvo0uFj0R5nMX7Wx3Lc5
         5oBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774420987; x=1775025787;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=iprtSxBJOHuVEk2TVxztxYPzYegRSDoPkW6NGohZoQc=;
        b=b7VncNv1/GbE0yMnBFVjjg3+0hdDmjqtoMw0vHdNc5xc99RFOdIOSGt/RMUKW9qx1u
         4dbMirDeVzZoL+wpSp5ON0039WOpu6o1/r0cGdknnWXF+It4HfuMKH1wmMxUET12SHmK
         gFCIFToX2R/3WdiJblfnLq+Fd089AzmeNc7lAnIlfewUW5miQZLD0wM+g7vZHrXdu/Xd
         un5oSvd+lxfstoUfnw3DOUaL7jbRXrTPYn6YMTuNjhGagNMmd+keSx0rP3N0HoI1ZF+4
         3QnrygEDLviBrapq9kAc8QiX1pIWymC+t3eY2+kA0ifEVVu232UOpHC5H6F0CK6ql5ra
         WKOg==
X-Forwarded-Encrypted: i=1; AJvYcCUpYfLGlyn13WYdkyZGngSAoQ50fv/6AWfHdfAXugTugCohu6R7rNAK4S+5K5UPId/MeloxabSHJftD@vger.kernel.org
X-Gm-Message-State: AOJu0YwdiHsmi+thYZQ2fS8hnwKHmSk5r16GCx4bPAHWQR9U1PVm+kL5
	xrhbigXxe18PtZhjouOncFyP89xtUMGz079y20SFP8v68iOO+g5gBXHToUMXU0bcrIPFH3/3cBR
	tfhUUbM1TahyzQ2CEkHP1Gp3Fi/GY/d1XNDhxL7XLb7NzvrX0ScYVYoW/kKR9EZSVxXOlov5bni
	ax4Q==
X-Gm-Gg: ATEYQzwVuUjaSidO6odvu6lcb3uuApO70M3vHIEDxyW7DduicrIgPUWvOKnxinL3wsW
	k2MUi+iCr8scfQ3X91zT9FJYBglBNWUk2zAInb9Kvrh4RmePlvVWgMdYe8KB8PjFlnCOvfZU3cQ
	h93EFjqBbNlcStlNU1CWXFC+xldwdB+MSxglKqKr8DglbhWAGABqwpDiZgowjZXNCEJbQtttP0l
	r9q9j9f82ivrcpgkwdrwzNivijm1Zm95JGsegg/pJricVupP3NwARd2DDzNBwd4Vw778TjsG3Ff
	s/IHf8RoDh9CGnAENbJ1zYr5WtNIp0PpsweA0CU8xAb+2EFDMdpewCyhlm8Ze1YI8f/+8owLrZa
	qIAwhBASr4dGmx+gh6VDshCHxHqVU5+YioMd8QWsJ8MZedax79VSOEnWUL+dPZzkv3JchOBYUO+
	MN+xiy4I27GeI=
X-Received: by 2002:a17:90b:3fcd:b0:35b:a760:1a44 with SMTP id 98e67ed59e1d1-35c0dc796afmr1487524a91.2.1774420987001;
        Tue, 24 Mar 2026 23:43:07 -0700 (PDT)
X-Received: by 2002:a17:90b:3fcd:b0:35b:a760:1a44 with SMTP id 98e67ed59e1d1-35c0dc796afmr1487501a91.2.1774420986546;
        Tue, 24 Mar 2026 23:43:06 -0700 (PDT)
Received: from [10.133.33.49] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-35c0dc2a13dsm647589a91.1.2026.03.24.23.43.03
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 24 Mar 2026 23:43:06 -0700 (PDT)
Message-ID: <79347f14-29f4-4f8c-aa70-25a8bbded0be@oss.qualcomm.com>
Date: Wed, 25 Mar 2026 14:43:02 +0800
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RFT v2] arm64: dts: qcom: glymur-crd: Enable WLAN and
 Bluetooth
To: Abel Vesa <abel.vesa@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260324-glymur-dts-crd-enable-bt-wlan-v2-1-6afcf1ac277a@oss.qualcomm.com>
Content-Language: en-US
From: Zijun Hu <zijun.hu@oss.qualcomm.com>
In-Reply-To: <20260324-glymur-dts-crd-enable-bt-wlan-v2-1-6afcf1ac277a@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=Jvr8bc4C c=1 sm=1 tr=0 ts=69c383fc cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=bC-a23v3AAAA:8 a=EUspDBNiAAAA:8 a=kcT8zHn9ULDl9SQ3-_4A:9 a=QEXdDO2ut3YA:10
 a=iS9zxrgQBfv6-_F4QbHw:22 a=FO4_E8m0qiDe52t0p3_H:22
X-Proofpoint-ORIG-GUID: pBmGyHYTWCEHZ8DpGF098WD8sIcaRjKq
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzI1MDA0NSBTYWx0ZWRfX5r3YzKWbPcuL
 1RzAq1xleRVwGdb72ICEEZ0VXDIDUO5P/nmA6AHarQ6F1k/XSo1Tgd1xqNVKzF4ePhVWUJutnrO
 8d4mt60da/vyAcUob6WVujchIRoJQ9osaxuFFFDwvvY4jpIGVxwYmWINQvMogtckAaVwZpjEMAx
 AKle7OfDTYXuSClzHj+gWh7s8QBebz1jGoYncp5lXVHbTdqWZ4ddYKA29DpLElZ/45I9sxJBNB+
 DUYmwcIn4e2hoRQxhd5p5AQmu9py2mkuS4Hg8T4CgIgbmxhg2hpP49hgYDZcUgU62j1d/VUm8Tn
 hYTBAVW1eDMspj4qMQ/h6sicFjJk0N6Y5tNk5tRHn7sO6naonwMKdymDtI+vZfYe+2mqlDyA+Wk
 E7fApQO7DK1Zne7jggvywHug4PCEhlH9cn01FYTHvnq9YLZHAUEDSWOY/HJfKx7Ru/odLw4Wg5M
 UdIiA5yKSXukGIL3B4w==
X-Proofpoint-GUID: pBmGyHYTWCEHZ8DpGF098WD8sIcaRjKq
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-25_02,2026-03-24_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 adultscore=0 impostorscore=0 suspectscore=0 phishscore=0
 priorityscore=1501 spamscore=0 clxscore=1015 bulkscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603250045

On 3/24/2026 11:12 PM, Abel Vesa wrote:
> Both Glymur and Mahua CRDs feature a WCN7850 M.2 WLAN and Bluetooth
> combo card.
> 
> So describe both the 0.9V and the 3.3V regulators, then WCN7850 PMU and
> the PCIe WLAN and the UART Bluetooth nodes.
> 
> Do this in the Glymur CRD generic dtsi so that both Glymur and Mahua CRDs
> benefit from it towards enabling WLAN and Bluetooth functionality.
> 
> Signed-off-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
> ---
> Sending as RFT since I only tested this on Glymur CRD.
> As far as I know, Mahua CRD uses the same WCN7850 board, but I do
> not have (yet) access to a Mahua CRD to test on.
> ---
> Changes in v2:
> - Rebased on next-20260323.
> - Address commit message issue reported by Zijun
> - Dropped the vddio1p2-supply as Zijun suggested.
> - Did not rework with the M.2 connector since the E Key is still
>   under review on the list.
> - Re-worked so that it is done in the generic CRD dtsi in order
>   to add the same support for Mahua CRD.
> - Link to v1: https://patch.msgid.link/20260309-glymur-dts-crd-enable-bt-wlan-v1-1-3badbddd5439@oss.qualcomm.com
> ---
>  arch/arm64/boot/dts/qcom/glymur-crd.dtsi | 118 +++++++++++++++++++++++++++++--
>  1 file changed, 112 insertions(+), 6 deletions(-)

Reviewed-by: Zijun Hu <zijun.hu@oss.qualcomm.com>
