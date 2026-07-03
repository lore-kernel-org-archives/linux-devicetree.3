Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 62AAF1F91F6
	for <devicetree@vger.kernel.org>; Fri,  3 Jul 2026 23:32:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783121560; cv=none; b=rom/o+1bdXv7H3/D5VopWVP+5Fj3CQTQ/huKJCMlU09J9uL4SENFfmaWGtC0syeFJ4GsQBC11Z9ByBi6iRDMpRUSMhO7l0YLew6eBKkUe9WWRis/5a+P2CVxOJe9lpd4iEZ4mHc7rj7R5AwwcoHxoM5x0q8fMY6c3LrBtxa+cx0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783121560; c=relaxed/simple;
	bh=wuESj9b85l1vW8rE4jIgNP5KS9UrLnHyyKAbSfhB5js=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=EOGAsH/gnyfENJ5YBD5cIl5pM2BKNjEvJnmkwR1ZzahTGYJrB3zfGKjC+gfITu2OrM/c+9vqWxjIo8ISgGSxdBDlq1LoLT6/rBhc307NoVwCfQYqmbgyQ5cUX0OdISJ4dGnZm7K7TaY2uLx9T20HwYiHeZSS4EUYbvNnWsFN31o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ByB6X4sj; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Y2hnlPS7; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ByB6X4sj";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Y2hnlPS7"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 663KPYub1040097
	for <devicetree@vger.kernel.org>; Fri, 3 Jul 2026 23:32:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=rCUR0wz38uCbldyWNaolcJvt
	e3Z+vL8gly+V3QJ2IU0=; b=ByB6X4sj1Aby7ZzUMNL/uU4Si6hzDCv/8oNQU/Yx
	WTYmdMdZqzPL2s8EdHrfnar1dNAUCGNlGHhG2vNSyHSnaNSxoNgQhQ05HU9Kifc2
	MQwi3MKD+6WVhX1yLTsXBLuI6D6cKtgGEJQF7eX26xgpmeDGwK//0hgrOxOZUBAA
	lmSIcaTUjUnJZGsunoBzM/XDf9Pa+ojs7mIIOql7Hl6uUkghsagqsDq+i1HU2Pse
	4sUREjrslbD6eebEXiw9/NzWaq382vJlAKP5QkM4UwFAw+8LBPdpl9/qNVP0xp6P
	3SzeaBV7CUzDd/KqpaLHdi3DArwFShTe14B2+HaXGwE25A==
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com [209.85.219.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f6a84amk1-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 03 Jul 2026 23:32:37 +0000 (GMT)
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-8f08560ea44so10600706d6.1
        for <devicetree@vger.kernel.org>; Fri, 03 Jul 2026 16:32:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783121557; x=1783726357; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=rCUR0wz38uCbldyWNaolcJvte3Z+vL8gly+V3QJ2IU0=;
        b=Y2hnlPS7CETYPIR0gdPPY0H2UWTRJP2G6MjAJtfRqr+8/XXMMJxsuLAz43l7pCSniA
         2Joa15hfRvgnP2mvsZiXqO+/FWeCwl8rYcpYbcdGATpgjikXviskJ2C0g1Y0cEmIDSAS
         XqPA5BJCX3ah/KMTITOFfwg4sXehbS7cwxk75fOGf+TR/VPcIAm788TTAy7C4gXnD4zR
         PDxYLB1ABs5qLSCwcuh/tC91MQ6x6IjXa2wRQ9g07IczYagB9PjuMXzh5Qh3jJOwP+4b
         eBH3KmrbYgx8BChhAHg0O11gb3684fpFtUUpdBA2TjlzTehshOpu3KPeoxoaRNxRuBv+
         Wf1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783121557; x=1783726357;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=rCUR0wz38uCbldyWNaolcJvte3Z+vL8gly+V3QJ2IU0=;
        b=JmtHXCU8AHk10KyV1iuJHkSBfOwdiqHRUU62pWTK4gxM3tWFIDExrLeKGuoiNJjKLQ
         gMcup0dIWlGl6vETbSRzQO0pil8lSUztd5ld9WymYh4Ha/95sRm1oRPCHtzFcMHngr13
         hoz7vy9VC4ooYRqdUl6Uq8DjiI9Fj3+Rd1sHZ/+Xnl6y/aXU5oAs1l2WOZPKUGnJVasK
         qbllIQosyM1okkOdzwYLPpywKq9GdeRAs/fz3hCggsWZSi8vjEi75F2VSU8j0VXriZVG
         e9CU789qFOjepWO+4WDSfTj2PQBli/QT3E6EMltmyVocNNC9LlRvSDZNQLuTDWxkOzM2
         ckGA==
X-Forwarded-Encrypted: i=1; AHgh+RodjOGynZT+QRuYAsyjnlY7lsjlqMy3D/K8Bg1xadHu81GocrnB/Lw9lo/DGI+i4MS7RvJxxo1svpm4@vger.kernel.org
X-Gm-Message-State: AOJu0YwKKEnajs7akdTyIUhPoEIw+MXKlba2fwD30vo2QKNrmteTBYVG
	03/pbLujb0LM6/IAWHPD6qRGOSrMIECXNil7Pupz0erJ4gF0Ph3LGnW9n3N0o8CZg9NaQLOs5nO
	4MAshnovok8xElXQbxHDNBs1nsbgLOST3Pp79HXiWGETtOgBdiYtV+1RQIlog9d3w
X-Gm-Gg: AfdE7clYnZNczjlw+qx3cgn3oJfuKtiY23xnQ2vK+xNbODDShyny0aE8g599j/NO7j/
	KM0fUhvdylAu3Ew2UMzr5EEyObiXuzUOIlIu7W9fFZOAYCNczVU+1nIligaauaXe9tyqvIIWVuZ
	2/RPoCjfflw4CV7XED+WpKF3XjlHMeIsoZFtbIUBq/ZW2afQBWKTlB12N6m3+MeS52pHfKsqXYU
	pZDlb1/q3Lcy3Qc7NEl0lQOF78TobSN0PiyddYq1bdzEWpQDb6oWrO2+ddA/ARPCCnjidUJmx8i
	70/jdorchODqkK04BUeXv4G95jd2QFzJOjIvr7fQuKtBquT+wKsnkp5v1rTY+fgWw7Aw4bnTBye
	JCHq2julqS3f7CXku4CUMjrte6/er3qeZtkcUbtWkaS7qMyK5SlwonFwnjAJz8SWVMlbVI9OTPG
	cHKEYfhpgaC+YDIoyeNoZDa8Wj
X-Received: by 2002:a05:6214:3d9e:b0:8e9:f62b:8f90 with SMTP id 6a1803df08f44-8f74ccaf291mr18725826d6.54.1783121556495;
        Fri, 03 Jul 2026 16:32:36 -0700 (PDT)
X-Received: by 2002:a05:6214:3d9e:b0:8e9:f62b:8f90 with SMTP id 6a1803df08f44-8f74ccaf291mr18725536d6.54.1783121556087;
        Fri, 03 Jul 2026 16:32:36 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5aed13c3be4sm839833e87.73.2026.07.03.16.32.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Jul 2026 16:32:33 -0700 (PDT)
Date: Sat, 4 Jul 2026 02:32:30 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: george.moussalem@outlook.com
Cc: Bartosz Golaszewski <brgl@kernel.org>,
        Marcel Holtmann <marcel@holtmann.org>,
        Luiz Augusto von Dentz <luiz.dentz@gmail.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Philipp Zabel <p.zabel@pengutronix.de>, linux-arm-msm@vger.kernel.org,
        linux-bluetooth@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Subject: Re: [PATCH v3 2/6] Bluetooth: btqca: Add IPQ5018 support
Message-ID: <hb5njj6m6dsc5ply5mfvagbut45uw6v6pomsrah4g6wuarp6lt@vaarxn4bwnwl>
References: <20260703-ipq5018-bluetooth-v3-0-62da72818ab3@outlook.com>
 <20260703-ipq5018-bluetooth-v3-2-62da72818ab3@outlook.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260703-ipq5018-bluetooth-v3-2-62da72818ab3@outlook.com>
X-Proofpoint-GUID: XQFRXN4HGPaZhxVvlfJxW1lX861n20L5
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzAzMDIzNyBTYWx0ZWRfX4xdl53LNtyVY
 CVhLPHkXro+dsjmTA4JDXChjEYUpUDA/j1HItxPipTwa82986LlXlZmBiBktJorikHxiwdzm2f3
 WeXYNr0HRdFMlEy+3t1iTnjKB/j7CjU=
X-Authority-Analysis: v=2.4 cv=a6QAM0SF c=1 sm=1 tr=0 ts=6a484695 cx=c_pps
 a=oc9J++0uMp73DTRD5QyR2A==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22 a=UqCG9HQmAAAA:8
 a=EUspDBNiAAAA:8 a=o9JC6ioeNWgGuw0WDxEA:9 a=CjuIK1q_8ugA:10
 a=iYH6xdkBrDN1Jqds4HTS:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzAzMDIzNyBTYWx0ZWRfX4qqh3qfseXDM
 8FLtQSgGbDO+k+GV8bs8RPYdG1yD7fgucTuajh8tJTcmHyAUBZp34/tBoFCjZ3cPDWFYwvrJcFa
 qAblOBsSR40h6LzrTAT3louFuUt6YeB/c5kgL/nf61Cc/+CoWe7vbiP0RWUPNs9fpOC8XYCkp/h
 z19ZWF9SVbqNbhMGpoHtfqZa0kCIFCg46+ZQcnNcVfPRLiTdr48ZQe95wdGsyXGovCzSEaAt9ga
 M7zR5DxOoVzrKsgdA3T7HBuV4puphsYn2tO0tc7UFTLHdTuBc1w8SnEqEegJqtryUA17BWsqv1G
 4AotYueUw8Dy6rcOlJZVqJocSCSSFwQCoJD9q62+b6MI2/8PUXijTbpAKZFsNITg/sUcum46QZT
 8zNYMVubiNBIFh52srV4WePgRCf9I6Eo5jkBPIDvBnNQhnLedc3OUj2kVgrmACNcJc4Y9Zu1Fb8
 queb90nIp6DihbHUcUg==
X-Proofpoint-ORIG-GUID: XQFRXN4HGPaZhxVvlfJxW1lX861n20L5
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-07-03_04,2026-07-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 suspectscore=0 malwarescore=0 lowpriorityscore=0 adultscore=0
 bulkscore=0 impostorscore=0 phishscore=0 spamscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607030237

On Fri, Jul 03, 2026 at 09:01:50AM +0400, George Moussalem via B4 Relay wrote:
> From: George Moussalem <george.moussalem@outlook.com>
> 
> Add the IPQ5018 SoC type and support for loading its firmware.
> 
> The firmware tested has been taken from GPL sources of various router
> boards. Firmware files needed are:
> - qca/bt_fw_patch.mbn
> - qca/mpnv10.bin
> 
> Acked-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
> Signed-off-by: George Moussalem <george.moussalem@outlook.com>
> ---
>  drivers/bluetooth/btqca.c | 16 ++++++++++++++++
>  drivers/bluetooth/btqca.h |  3 +++
>  2 files changed, 19 insertions(+)
> 
> diff --git a/drivers/bluetooth/btqca.c b/drivers/bluetooth/btqca.c
> index 04ebe290bc78..e136e91976cf 100644
> --- a/drivers/bluetooth/btqca.c
> +++ b/drivers/bluetooth/btqca.c
> @@ -380,6 +380,9 @@ static int qca_tlv_check_data(struct hci_dev *hdev,
>  		break;
>  
>  	case TLV_TYPE_NVM:
> +		if (soc_type == QCA_IPQ5018)
> +			break;
> +
>  		if (fw_size < sizeof(struct tlv_type_hdr))
>  			return -EINVAL;
>  
> @@ -794,6 +797,9 @@ int qca_uart_setup(struct hci_dev *hdev, uint8_t baudrate,
>  	else
>  		rom_ver = ((soc_ver & 0x00000f00) >> 0x04) | (soc_ver & 0x0000000f);
>  
> +	if (soc_type == QCA_IPQ5018)
> +		goto download_nvm;
> +
>  	if (soc_type == QCA_WCN6750)
>  		qca_send_patch_config_cmd(hdev);
>  
> @@ -881,6 +887,7 @@ int qca_uart_setup(struct hci_dev *hdev, uint8_t baudrate,
>  	if (soc_type == QCA_QCA2066 || soc_type == QCA_WCN7850)
>  		qca_read_fw_board_id(hdev, &boardid);
>  
> +download_nvm:
>  	/* Download NVM configuration */
>  	config.type = TLV_TYPE_NVM;
>  	if (firmware_name) {
> @@ -939,6 +946,10 @@ int qca_uart_setup(struct hci_dev *hdev, uint8_t baudrate,
>  			qca_get_nvm_name_by_board(config.fwname, sizeof(config.fwname),
>  				 "hmtnv", soc_type, ver, rom_ver, boardid);
>  			break;
> +		case QCA_IPQ5018:
> +			snprintf(config.fwname, sizeof(config.fwname),
> +				 "qca/mpnv%02x.bin", rom_ver);
> +			break;

Please keep the switch-cases sorted.

>  		default:
>  			snprintf(config.fwname, sizeof(config.fwname),
>  				 "qca/nvm_%08x.bin", soc_ver);
> @@ -958,6 +969,9 @@ int qca_uart_setup(struct hci_dev *hdev, uint8_t baudrate,
>  		return err;
>  	}
>  
> +	if (soc_type == QCA_IPQ5018)
> +		msleep(NVM_READY_DELAY_MS);
> +
>  	switch (soc_type) {
>  	case QCA_QCA2066:
>  	case QCA_QCA6390:
> @@ -965,6 +979,7 @@ int qca_uart_setup(struct hci_dev *hdev, uint8_t baudrate,
>  	case QCA_WCN6750:
>  	case QCA_WCN6855:
>  	case QCA_WCN7850:
> +	case QCA_IPQ5018:

Sorted too.

>  		err = qca_disable_soc_logging(hdev);
>  		if (err < 0)
>  			return err;
> @@ -1001,6 +1016,7 @@ int qca_uart_setup(struct hci_dev *hdev, uint8_t baudrate,
>  	case QCA_WCN6750:
>  	case QCA_WCN6855:
>  	case QCA_WCN7850:
> +	case QCA_IPQ5018:

Sorted too.

>  		/* get fw build info */
>  		err = qca_read_fw_build_info(hdev);
>  		if (err < 0)
> diff --git a/drivers/bluetooth/btqca.h b/drivers/bluetooth/btqca.h
> index 8f3c1b1c77b3..343cd62d1137 100644
> --- a/drivers/bluetooth/btqca.h
> +++ b/drivers/bluetooth/btqca.h
> @@ -54,6 +54,8 @@
>  #define QCA_HSP_GF_SOC_ID		0x1200
>  #define QCA_HSP_GF_SOC_MASK		0x0000ff00
>  
> +#define NVM_READY_DELAY_MS		1500
> +
>  enum qca_baudrate {
>  	QCA_BAUDRATE_115200	= 0,
>  	QCA_BAUDRATE_57600,
> @@ -158,6 +160,7 @@ enum qca_btsoc_type {
>  	QCA_WCN6750,
>  	QCA_WCN6855,
>  	QCA_WCN7850,
> +	QCA_IPQ5018,

Sorted too.

>  };
>  
>  #if IS_ENABLED(CONFIG_BT_QCA)
> 
> -- 
> 2.53.0
> 
> 

-- 
With best wishes
Dmitry
