Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0009742EEC4
	for <devicetree@vger.kernel.org>; Fri, 31 Jul 2026 14:42:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785508958; cv=none; b=jRSC693zHbTh7B2MgVZkJ7sBZ5jWjWGhB0fysmewAyzNoETrv3A/zbGDHnYC9IsGm/VYueewyaOV18AKHAakJJi00A2T9d5tJJqJVPA0ln6mf67f446ghAUn/PVF1dY5t44cLxEUjM7Y2n+p1jGfbPHRO9Y4L3uHxRDKcA0IDSY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785508958; c=relaxed/simple;
	bh=tBo1pOIGLQzGzdk2QTAoCK07FNlt308/uZWd59j360w=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=YBMLcfqibXiWSvZT3HMeN9dBeJUFiBkEDbAp1UAj+SLioIQG3JIjO7GAJXy7EMwxANPB/Qojlfx5KS6qcD4SEmokMYO3Pjem1svOfeKBM1/PCrC7vlu3Ibtnrzyc/coPF59CYJFU/JVL8oypnaA4smEjWtjAEmjFUk8AuGT5rec=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=o/rNEoJ8; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=iMAXKoYy; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="o/rNEoJ8";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="iMAXKoYy"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66VBd2gn4185652
	for <devicetree@vger.kernel.org>; Fri, 31 Jul 2026 14:42:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	hV/RxAH1jzvT9xYdfJOYdrkiDJC+wzPI1b5Q4RRYKRg=; b=o/rNEoJ8Oye8yOuF
	zL6GwiazrXRPiI+uF8nuWoBzc0ZlBjPX+m3pwkU8aGZ46/XUJ/H4BikXVmcxx/8a
	jEJtTz8kgaAQeS52Zv/l9JSSCEbbIvhW0j9P8T9yJyvAMyqO/Z2DKI2wcD58YOx3
	CDUxaim7tmttEvgQKpkJ+bCJ78WZCo0NGeAdCJqqzPktw8/0P3PkedyWGrav8FLr
	0+K8G/YaIQWUya9VPJ1w7TXufpter81WjdDhCP5qMIpCgmDpbwL7IFglq6wc5Xwb
	KQSnDZbRiPz4YaR4NoBTXBLvXTCd8pbwGyHz/HmAOk9lp75Jk/3OuxBrdcGz0S1l
	1WSbdQ==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fru130s34-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 31 Jul 2026 14:42:35 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-93105103d06so18939485a.2
        for <devicetree@vger.kernel.org>; Fri, 31 Jul 2026 07:42:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785508955; x=1786113755; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=hV/RxAH1jzvT9xYdfJOYdrkiDJC+wzPI1b5Q4RRYKRg=;
        b=iMAXKoYyNT3xLjRpA0//GrIksqRCjKwsKFqDNO4T7Y/pPEunAS4sM6uruyGG+4py0X
         ZMMgbNbMFa5aCfE1EFazCW7/fmfDoCn14PaXQ0z6hFvDXx0kc/jV8WbrmtSlUOxaMVYf
         51iiPOoi/VD5zE6aaTDLpCgnBtqDKlEvGubkoGGOKgYn2jgdl3bLay78jECbafsnMDv3
         xGQkGGb8VBu+tP61qhkv9sruEsQDtdl5sOdTtlk3R3QEXtzYZB8i4b9K8+L5F3sG1rpS
         +NL4/Dm5hX2WJi2jtliLufLlCnhOKgnEgmrFQ8ETaccCKiilF2S70fxbSoZnFP854U4M
         SwrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785508955; x=1786113755;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=hV/RxAH1jzvT9xYdfJOYdrkiDJC+wzPI1b5Q4RRYKRg=;
        b=cTQpzwipcd2/2XJ4UmVwrOHqi8AjvanqX3uE2oB/+dPuPO9267KvQ7wYpMMfQUD3yo
         b1T4MqfWFrGnxL6/1Tr2uz2naOzbjSGtJOSMOjo9Ka3yNi0yHoetTWMF+15mk+uenn8E
         NAjBSrYOx01F2hwWSFrhqxS0Jy38k8G/CzpuulCTcBkUve4sXKjqtDXmQKylrQ8KPJ9R
         9kDmk6p3hlwxBhHCp7hL7b4s3taCUJXpQzP65Q0uicEpq82JCpwlQzyWlVTz24zo+aUf
         2R0rYAJ1mxDIk5ej4Zqt7eOCIRAO81Xf2sIPBtyycxwyNp/n2SGv1WDTN7ltQ/dTT5Ef
         lJvg==
X-Forwarded-Encrypted: i=1; AHgh+RrMOcVLH2+9v3qAEpnMvbtMJLUymopM7VS3yUovqyzVEDa9z+PHLGdYXY2PQ0tMJWw4b7JD4hB8ckoG@vger.kernel.org
X-Gm-Message-State: AOJu0YxVj+XqU2Uu6Za6Ja8hWPjs89DPoaaU1WoCTgUNJydFweK3gehG
	HST48FKByc5WT9DHnfXuhd/+zKAQrlQ00iF6ys/M7LbR0ad3dbYct8ngVw5SxHantyFPunROa2g
	7ldZ8uCuo4VU4DgfliywCZoAxz/QiDAvHldBKaw80KLCiKW9goKcECpXGmA/bsHBO
X-Gm-Gg: AR+sD108wBzfRU0vIiTe3R5aDtFW7qlCQEOtBpxvP4He3UsJ6bYqLB/81Rt04+IFW1O
	qD4Higrh+IZD+RiaYNvX+XOKdi9Ql09PG+n3BtC4MsBycnnaac4comIUljoGWNqLN/+3nOsH/Sn
	C4Uo5iYkHAfwrcxp7JaBWPawKfd9LlAtfMXSwpGH2yXFWTLT9GIxg7CBM+RZAIooEKhQe5PhCM4
	w/TdCUbAYhM42Onkpi2Dn5Yr1z7HuJw81WXz3R3QO4mKg10Wp1yZPxgZOyEdpazZDZ7tkOpotuV
	UxcdjAPgdaFTuZVElHZkLrWk+TKEp8hSXXvIBdSubpF82ZUXL3KomlfgcvlwGBqKpVLXvuTfBrz
	CLOEOGj3qBs0x4AnYwoBjXQjI
X-Received: by 2002:a05:620a:17a1:b0:930:f930:a09f with SMTP id af79cd13be357-934a06e88c5mr34877485a.1.1785508955233;
        Fri, 31 Jul 2026 07:42:35 -0700 (PDT)
X-Received: by 2002:a05:620a:17a1:b0:930:f930:a09f with SMTP id af79cd13be357-934a06e88c5mr34869985a.1.1785508954780;
        Fri, 31 Jul 2026 07:42:34 -0700 (PDT)
Received: from [192.168.120.193] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-39f812e3a7dsm1541071fa.32.2026.07.31.07.42.30
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 31 Jul 2026 07:42:33 -0700 (PDT)
Message-ID: <c6526ba0-be08-46c6-a501-1b161939657c@oss.qualcomm.com>
Date: Fri, 31 Jul 2026 16:42:29 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 06/16] usb: hub: Associate port@ fwnode with USB port
 device
To: Chen-Yu Tsai <wenst@chromium.org>, Bartosz Golaszewski <brgl@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Daniel Scally <djrscally@gmail.com>,
        Heikki Krogerus <heikki.krogerus@linux.intel.com>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Danilo Krummrich <dakr@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Matthias Brugger
 <matthias.bgg@gmail.com>,
        AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: linux-acpi@vger.kernel.org, driver-core@lists.linux.dev,
        linux-pm@vger.kernel.org, linux-usb@vger.kernel.org,
        devicetree@vger.kernel.org, linux-mediatek@lists.infradead.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        Manivannan Sadhasivam <mani@kernel.org>,
        Alan Stern <stern@rowland.harvard.edu>,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
References: <20260721065413.2306137-1-wenst@chromium.org>
 <20260721065413.2306137-7-wenst@chromium.org>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260721065413.2306137-7-wenst@chromium.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzMxMDExMiBTYWx0ZWRfX1AjB6mLK/kXa
 3aqFlgWqBQmfm6SCts8hMPl5W+u9cur/ABKUT0y8kjlFoZrDYVBR1cbMCRWgAPVSIsT/q7ojmyr
 OFUBUDb7wiLiYYxvfeKQL67OX9Sr31s=
X-Proofpoint-GUID: dYuK727lV-H7ebq_uzvEa6zx1Zzzcfvp
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzMxMDExMiBTYWx0ZWRfXzwy97nw0XGtg
 g7WTE2ihokr6CgwVjO1wAuIRwL4H8JZ+ooR+7VijDlbai0QYl5r+ilFCjuV7jIQw2Pbwf4QYsF4
 Q7QirFdLDOmFsKTbI70Cys3KuksIMsba2UeOuJmuUlfIVqtAQJN2pksUJNqpo758YgVLFkx8rga
 LjGmJX3H2IskPNrxWdEQeDUNueeLcHIVkAjCNqyLZ394gIkl0MLuyWNJzhHBK7DNqj0iFO+Rz2Y
 VEjE//upjeL0FP8Q39Zr9/NpNDrdbioezBkdSHcnG3wPdmqSDPLwPFqQxjhjRHOL7ANHHPVw+iU
 VWuZi0fK91+6fzK6WFImGeo8/K/b/YLD98txJ4N0nB16BH/V3leTXpeKE9UQ2mFg05SRoSRnqZu
 oai1SDk27hZNwjRPx7xxRsJAdFk+xNeMjQP+Ba0MAr3XzPPhZ0rzGsDesnKlW2g5lsgrC8MXHZO
 BmwpAGsa+YIugdgXAEQ==
X-Proofpoint-ORIG-GUID: dYuK727lV-H7ebq_uzvEa6zx1Zzzcfvp
X-Authority-Analysis: v=2.4 cv=CYI4Irrl c=1 sm=1 tr=0 ts=6a6cb45b cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=QyXUC8HyAAAA:8 a=EUspDBNiAAAA:8 a=cm27Pg_UAAAA:8 a=7ZmCE17i0x7kTLN8kT8A:9
 a=QEXdDO2ut3YA:10 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-31_04,2026-07-30_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 suspectscore=0 spamscore=0 adultscore=0 lowpriorityscore=0
 clxscore=1015 impostorscore=0 bulkscore=0 phishscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607310112

On 7/21/26 8:54 AM, Chen-Yu Tsai wrote:
> When a USB hub port is connected to a connector in a firmware node
> graph, the port itself has a node in the graph.
> 
> Associate the port's firmware node with the USB port's device,
> usb_port::dev. This is used in later changes for the M.2 slot power
> sequencing provider to match against the requesting port.
> 
> To avoid potential conflicts with ACPI firmware nodes and then causing
> power management issues, only assign the firmware node if the hub's
> firmware node is not an ACPI firmware node.
> 
> Reviewed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> Reviewed-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
> Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
> ---

[...]

> +	/*
> +	 * ACPI FW nodes are associated later when device_register() happens.
> +	 * Skip assigning one here to avoid potential conflicts.
> +	 */
> +	if (!is_acpi_node(fwnode)) {
> +		struct fwnode_handle *port;
> +
> +		/*
> +		 * fwnode_graph_get_port_by_id() returns either a valid fwnode handle
> +		 * or NULL. Passing NULL to device_set_node() clears any associated
> +		 * fwnode. It is effectively a no-op here, since no fwnode has been
> +		 * assigned to the newly created device yet.
> +		 */
> +		port = fwnode_graph_get_port_by_id(fwnode, port1, FWNODE_GRAPH_DEVICE_DISABLED);

This works if the node at the other end of the graph is a
USB hub, e.g. from qcom/lemans-evk.dts:

usb_hub_3_x: hub@2 {
	compatible = "usb5e3,625";
	reg = <2>;

	peer-hub = <&usb_hub_2_x>;

	ports {
		#address-cells = <1>;
		#size-cells = <0>;

		port@1 {
			reg = <1>;

			usb_hub_3_1: endpoint {
				remote-endpoint = <&hd3ss3220_1_out_ep>;
			};
		};

		port@4 {
			reg = <4>;

			usb_hub_3_4: endpoint {
			};
		};
	};
};

But something I faced when I was poking at USB4 was that dt-bindings
currently assume every controller is effectively single-port and the
of_graph ports under it represent HS/SS lanes, i.e. the entire
"ports" subnode represents a single USB port

I think the solution here would be to do ports {} under the controller
and have every one of them have 2 endpoints (for HS and SS
respectively) - then, each DT-port would correspond to a USB port
(sorta like in the hub case, minus the hubs are split for HS/SS so
they have just a single endpoint under each port)

But that comes with a big breakage, as always..

Konrad
