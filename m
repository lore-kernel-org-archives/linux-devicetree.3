Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3A05A3090CD
	for <devicetree@vger.kernel.org>; Thu, 26 Mar 2026 10:45:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774521944; cv=none; b=VS0rKTN+IMPNlDMZ3v70O+MgGK0zImD3mTPVOsdtO/PBjs57c99AnnpjZ7CtPyAxRp/Y4DPNrZLn5shCc86Iy4Q0qgMyJ4tA7S3XygOmDeyFF3nOpx1oAMUBvANyrm0MXh6Z3n5IMOG0KpU274+hFSgnb8lQPhNQt4h+qCWl/mM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774521944; c=relaxed/simple;
	bh=KuE5wMXOF5HDbAynVpU3oy802Br8p58lz9x7bevUe5A=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Wv4APHP2DrWxy0k7JIg/WlsFxxrqvBtLRUXeJ0UKbkXgNQu31Pqh6lsnx1SOCQnG+mLYKUDsw9Sucwx4CCX5gf8lmrTzfYMaS9DHF3m6r8YqqljY1KFeh+sTvkTRptV4dTcZhiBjXvIQvpQ5O4yv9UKUOYI+ckqqReyHVFidKFg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=DFM9xEKA; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=U+1VSlyL; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="DFM9xEKA";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="U+1VSlyL"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62Q8D2kR1810931
	for <devicetree@vger.kernel.org>; Thu, 26 Mar 2026 10:45:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	wr11UVgqGoxu05TLkOfnjgR77V8kxzjaqIhhpa+9RfI=; b=DFM9xEKApWvq8G7d
	Phgz+UslHMg27+So/3F2w88xVAP//Sh81Bj/6kjF4mW+HhAkRnTG4gvhtsHestsH
	kHR6HlVA57FToqI9/IXk74tRAeKkzf4L2qg6JV+oH31fk44pve8Eng6y62S41arP
	Pf82j0BSgGm/UHwp4YPXuHicR3nPYZ8zYEukLNY6RJQb5siMSC6U+81t+o59x+Yp
	qqz0gk7wyN1PJFrN5Qfof+4Bv4w0w0wFJXSbSAwTOMlPC7GDC/ZLB7vtorbC1k1u
	484ZJ+QQqyy1ojvmJfecUS6IwbJpvVIBrPXd5pnMfIBp6rntTnrOOFwCGK9etxm+
	zfuNng==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d4tkn1uht-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 26 Mar 2026 10:45:42 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-50b86b756c4so2867961cf.1
        for <devicetree@vger.kernel.org>; Thu, 26 Mar 2026 03:45:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774521941; x=1775126741; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=wr11UVgqGoxu05TLkOfnjgR77V8kxzjaqIhhpa+9RfI=;
        b=U+1VSlyLp3zAkO7gD71k5G5rZv8qdwSRgMrRKF1HGUL4Yg7QnDnTsMo7ZTUmxBzrpy
         Qfa8ybSfw3DgrJVjIFEMEi6eObjVYL/P2s5NMBd3CYAdLvrb2h9/4Jiy2r6aBDrZH7X6
         m14FHEucthxApvUIAg5HJLOr/wFUJKNqBbivtuduFNQxxuipr+ZUN9OPqxAvtXLQBD0p
         p4f/qE5HWmdzzZzZtSdYrzrEMzXlI0dRhrfD5DtMqAfa7/fai8QJyiTOvNt9wgAddsVi
         NSxWoTUZnQdJ2Vivq7Xdo2ANJe2u84RVjSu3QhIMOvp+9Mrl4JDJUxdczYmzqpdGYzDT
         xlXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774521941; x=1775126741;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=wr11UVgqGoxu05TLkOfnjgR77V8kxzjaqIhhpa+9RfI=;
        b=EJt1/9tlP9oiLB9p2yxwZtjwELIgI7OrK9hRid4PE51yReTt8jysPZGuqUyJhjhT9i
         5lB1uUt3NHMAYIz1/P8cXoT8yaZ0KZNXCII6/BYGa4Xwfk2+zSJY/KrIJhD48ciyLa6g
         drOCahUlJA/P0P66gnyR0cW8Pf+gxs4yOYTibLJxcUzJuzZF2d6S8Szh0OZLXGj3ohC5
         cWuXFg0byMUPf9Xt4IXpt+aq/E7bSJD7x5WPR+TrPcGUJK5NpJe8tX5fQHgGXvziWl1f
         JGtVe98LaDFrNCF6eL6V00P3pV7KEu61tncmCFgsZiPXALBI0t0DseanEKspayPRBDgx
         URDA==
X-Forwarded-Encrypted: i=1; AJvYcCUWG751kvCwV5/rwFjAcmG7WLLzggse1o0AsHikrunuevJ0oUvkO6a/1LZDRnU/NypLTi1meIMotob0@vger.kernel.org
X-Gm-Message-State: AOJu0Yy2fC32LBF188c/pq/lOYZWcJOfNuUHDq25bjMArvGj25Zg4v9Y
	2YcjuJlfi8FKSTV3G0zK5Y6tvtV3/jvyUUXpkiU/bdJ8vUPjvmA3NQx3LHMctB7zyfWo5F9bLeu
	AolTD1Bz30oeK6tLSOvZHKYOuLANs/kfiymdHSDDN+DBkBu2lDZOaKf9agKxs3IEh
X-Gm-Gg: ATEYQzx3sQZmb9AqtLbcu4BdELyqvLLl2Zr6Wj60xh+AAUTvv+CSaYK5TDyVGvruWsO
	QMwqdJkhVC6ULbnyvYrwUvOQztH6oEGSKwtgHifgBHNbpElpxP+SgTYUmn6rYtzctytN6wi7iC5
	ZlVBR6Y4X38tBkRnD108Umx/O4mUfqJhrndEgky//xs35s5khHFyn3Lst0KUnm6SwKd16yi7dtl
	vM6t6Ica01MPDjPya6/v+03WYx1idTM5mMmrK9JjuV29XfX3g6YdQes/ooQfUEDgoLJ9yREAZJU
	zhGZ/QL1+TPZJSbXTPuoNz7iMrRM5pRJ9bkzx2/s0do4f9gyHHesaR8QQUYgfz8KF0TkO81gvWQ
	w1eFU3MOODO64zmR/9Gik8eWGfJ0ffGm/UmX0H+tmoAju9wIJmu9kFAg4cMkVnrIysbb+9Pvhhg
	vORsE=
X-Received: by 2002:ac8:7d0a:0:b0:509:47e2:9df3 with SMTP id d75a77b69052e-50b80cf75f5mr70961231cf.1.1774521941434;
        Thu, 26 Mar 2026 03:45:41 -0700 (PDT)
X-Received: by 2002:ac8:7d0a:0:b0:509:47e2:9df3 with SMTP id d75a77b69052e-50b80cf75f5mr70961001cf.1.1774521940881;
        Thu, 26 Mar 2026 03:45:40 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b9b20265120sm102392966b.16.2026.03.26.03.45.39
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 26 Mar 2026 03:45:39 -0700 (PDT)
Message-ID: <9c7b16f8-047a-4cec-b34a-28b94040f9d9@oss.qualcomm.com>
Date: Thu, 26 Mar 2026 11:45:38 +0100
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/3] arm64: dts: qcom: Add the Lenovo IdeaCentre Mini X
To: Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260325-ideacentre-v1-0-768b66aaef30@oss.qualcomm.com>
 <20260325-ideacentre-v1-2-768b66aaef30@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260325-ideacentre-v1-2-768b66aaef30@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzI2MDA3NCBTYWx0ZWRfX4s5LzaEVvnsU
 Z9kDgZPNU9dJ8hsFs/Cwjb5OuiR5XUbO+p+XDndsEaqQBJC/0VDP/PgAelZx8iLF+jqtNNm1pSW
 rSviU3JZR5/sylk6VwM//BWWlk/Oq19OAi3GEOb/jExwkT0tZXPW08UsnFChl6A9M2pZfhurivr
 Sod5R2DrbUFYLuetxC88s0wSjzIoIGYBX7UahYxXXpWDgoS7bl/eFO7QiGrYxkjUevFqfFhelDY
 gyE4ZlZQG7smPmUsWqh/vipcikh9ahHoGeOxH/MfHZdxu8sq1NbyyrdMjSenns4/TyUw1EFf5Ww
 Sj9GU++hxRt38kgYyt127+R9Hb9ze3yESiJhYweSrmOioEIz14S5RMJmbgCMAEckDSm961Lq7Wi
 P1/CxGIN2MBl4tkO0zIkYIQYg2whCAxJ8+QeLUwR2W3Lps4jexFdmegCGaeKgD/UEDdE5y8b/Nn
 wfrstiLhbe/6A8tTaeQ==
X-Authority-Analysis: v=2.4 cv=It8Tsb/g c=1 sm=1 tr=0 ts=69c50e56 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=oh5tWtvl8tmv48WKmsIA:9 a=QEXdDO2ut3YA:10
 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-GUID: bHs4rPMS-ZNgh9_6UQDTMs-gum99Rag6
X-Proofpoint-ORIG-GUID: bHs4rPMS-ZNgh9_6UQDTMs-gum99Rag6
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-26_02,2026-03-24_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 phishscore=0 lowpriorityscore=0 bulkscore=0 adultscore=0
 malwarescore=0 priorityscore=1501 suspectscore=0 clxscore=1015
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2603050001
 definitions=main-2603260074

On 3/25/26 11:34 PM, Bjorn Andersson wrote:
> The Lenovo IdeaCentre Mini X (Snapdragon) Desktop is a Hamoa-based
> ultracompact desktop PC. It provides HDMI, DisplayPort, USB Type-C
> display outputs, 5 additional USB ports, Ethernet, dual NVME slots,
> headphone jack, WiFi, and Bluetooth.
> 
> Introduce a DeviceTree describing this device.
> 
> Signed-off-by: Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>
> ---

[...]

> +&iris {
> +	firmware-name = "qcom/x1e80100/LENOVO/91B6/qcvss8380.mbn";
> +	status = "okay";

nit: \n before status, please

[...]

> +&usb_1_ss1_qmpphy {
> +	vdda-phy-supply = <&vreg_l2j>;
> +	vdda-pll-supply = <&vreg_l2d>;
> +
> +	/delete-property/ mode-switch;
> +	/delete-property/ orientation-switch;
> +
> +	status = "okay";
> +
> +	ports {
> +		port@0 {
> +			#address-cells = <1>;
> +			#size-cells = <0>;
> +
> +			/delete-node/ endpoint;
> +
> +			/* XXX: why @0? */

Because the binding defined it that way

Documentation/devicetree/bindings/phy/qcom,sc8280xp-qmp-usb43dp-phy.yaml

->

ports:
  port@0:
    endpoint@0:
	Display Port Output lanes of the PHY when used with static mapping [...]


> +			usb_1_ss1_qmpphy_out_dp: endpoint@0 {
> +				reg = <0>;
> +
> +				data-lanes = <3 2 1 0>;
> +				remote-endpoint = <&dp_port_in>;
> +			};
> +		};
> +	};
> +};
> +
> +&usb_1_ss2_qmpphy {
> +	vdda-phy-supply = <&vreg_l2j>;
> +	vdda-pll-supply = <&vreg_l2d>;
> +
> +	/delete-property/ mode-switch;
> +	/delete-property/ orientation-switch;
> +
> +	status = "okay";
> +
> +	ports {
> +		port@0 {
> +			#address-cells = <1>;
> +			#size-cells = <0>;
> +
> +			/delete-node/ endpoint;
> +
> +			/* XXX: why @0? */

Same here

other than that, please fix up the odd misordered pinctrl-n/pinctrl-names
and feel free to add my:

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
