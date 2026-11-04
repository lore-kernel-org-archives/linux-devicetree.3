Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793801053;
	b=VS7IW9ReZ0HSjhR2W/LK8VcchRkTAoymfDCmprgxWHg/HS0LCnJr4EgAZ5OFyag2VTro
	 shsl3GFed1yTU4XKkYtPJ+jV74LgBGu2TNdUnEZI1JzbTN1oVVUv2WOo9RPeoxTe9nn8R
	 yOs9jAIzJgiE4vzF9H/k4OftIaejU7MGGGcuhzf/6QFjom77fszv162RFy++czRedHqLb
	 VgqCqU/ukeNiY8b+lXNHNfObP/vyK7loEhI3uaJOOwI960VmH2y5cA8Fto7fdKz3NgFTa
	 Dun9xpKTvFaMJTJNUZw7mZREifqMZLAsy2AuQG1bUAUE3QlPIK3+yXh2CjgEYq4X4wg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793801053;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:
	 Subject:Date:Message-Id:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-GUID:X-Authority-Analysis:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=5H3S1tMGwgUyJGGvbEhwSu0HTzecRWvBS4g0moVmOts=;
	b=mBt3CxBw3B9Bk/p/WEdE4Ddhe1nid+I3dzkEit/NRMZ0BslivlZH1kFPwTGL8LTdeJuj
	 /p79QkAiRXwqjfzU30L1Y4vc4hK9JgKUQL0aHdjgVioxs9XzCClxksFbx4NN2mOGrQXvH
	 wjBx4wcbogBG/WC5nTDTF7ZlEngQBRqiDPFTxA8XAeWOcg3YcbzoKFatumN5s4J/wwukn
	 LhFKpnvxRGjRhvq3ImOtvjVz5vI7JIUsiiDpqEjzVQM00hYhsxHtu61bOg2ZNWYzZR89M
	 FuNWJXNPt2pWveAzjaHDuSye+Zc6CjVMyWtFWRHwBMmvr2XZQd3mqAy8Hu2en8nKYKA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=W5unUfNZ;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=KVk0pB4u;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A5C95606A326
	for <devicetree@vger.kernel.org>; Wed,  4 Nov 2026 14:04:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A5C95606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=W5unUfNZ;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=KVk0pB4u
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A4Ba02c608509
	for <devicetree@vger.kernel.org>; Wed, 4 Nov 2026 14:04:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=5H3S1tMGwgUyJGGvbEhwSu
	0HTzecRWvBS4g0moVmOts=; b=W5unUfNZKe5aOtcct16nGAhL6N5ti8P2ZBzqWy
	bI4XcIlDZ8XZje+hj9IZmcc6StJtjzKfDoANXircBWQtXQWT0v5f7mOZMlRU4TDL
	8NPNs1IyhUcbKIRBFcNkly1KnrkreDx7b+7Qx4LVrFlAZKbZeUHungLsESuhbrqA
	zKxkBCjQK8NvBGxOWJ7CpNTefHrzMV1iL8cy9w2f4Vs2EaJk1faAPxEzn9zuPPd4
	40xckNhvkh4gSZdLsb4k/VRpTRA/P+YPH95qcXkrnzqAX4zS50tMcNWegyAxt7KS
	gpwctoNmVaOFatZ9j//jG+f9Osan8Gr0sTMImCPjVUQBVyAg==
Received: from mail-vk1-f198.google.com (mail-vk1-f198.google.com [209.85.221.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hr3r80ks7-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 04 Nov 2026 14:04:11 +0000 (GMT)
Received: by mail-vk1-f198.google.com with SMTP id 71dfb90a1353d-5eac49decf4so119171e0c.3
        for <devicetree@vger.kernel.org>; Wed, 04 Nov 2026 06:04:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793801051; x=1794405851; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=5H3S1tMGwgUyJGGvbEhwSu0HTzecRWvBS4g0moVmOts=;
        b=KVk0pB4uHCwj7/PBhot2josxdLJHhgen4Qs49shuLMjPrDTbAUT9tNLg0JIMyxcSpH
         4AuTLAuKGmiynp9A6IjE6izsGpVnK3Ep5TYYtAgRuuxvkt4vB0OgjChovJLDsqBzZnpJ
         zoFiZo0OuiVgPQNCgdjuW8rCXNtn5kihR4/BtxluPLwhyOZsB1fSf8gboDhn+pp76wqN
         vKNiGLUZ4DJB+tGCrJdWWBnlBDCgCkNlFyfLFcQWHwUj8MYHxPejbPF+e5/Z1t2ieH8z
         a2GXh1Rq7QWn1CvhFr5dj3Krf/LcC29qk9LMougZR1kvq3PpheNKdhm+9kRQrA4036gr
         nIXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793801051; x=1794405851;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=5H3S1tMGwgUyJGGvbEhwSu0HTzecRWvBS4g0moVmOts=;
        b=UFp8akekpCTMH3twp8aswML6ifbVKdMFklV6nlbQj+Yjb3SFy8LL5mu9bWQDhGe+nV
         YuUNQPMXRkEqvpSCleRRZpdS0dgVJ7cAH+4gJDfxdXgjsRNQcc/1t4TGjckx+jp7NuAp
         MIrUUTcl8gA9HYw8krI2mZMMkgEleZG9ED+ul6bP0aW2QRoYkSeuNE226mcPO+Sk99fk
         x9cFVOdpkBupwVcADUspcPEXe8wYnroLMdPi05S/DCGGpDv1et4mvr11z7fvULlMgTou
         CjX+kpU0p0ibroZPF/ONENkdi3JMn6nS9HX0RDbGAnVHaOR6Knn61WehSjPXDA28H4NW
         pYSQ==
X-Forwarded-Encrypted: i=1; AKwUvBzjrBmkgnveEaZO+DaCa/vhKG+9bwvinYj/QvjcdSNv66CBZ6/bUVowB8re0w37vx0gjMK9IHqFiqIV@vger.kernel.org
X-Gm-Message-State: APuU4Z9+lMMgn8jyKGsLYGeliuKCR983+AH+i4NI9nGv7uBWCxd7EtvH
	jXIHyK6Rpb5H/8Siy5M3nWLEycIN+K0zsCqiaxFz+rA6arzSCJUSwDLgLD2+PMQMC5Lc3RA5PTd
	laiUhVc/onQ3iwbiSjPEnKbJtLAHYEwL8my10ogjFdhNQ5fflMpnSME8LotEkWEDm
X-Gm-Gg: AYBFou2RDM6o6rfIvQ4D6DJ6vFCqaNqpN/h7SuvVi4c9ktH9Ljp8V3uZvyjAlxiMFCl
	sLmh/YiGsetFXS0SpnUlKtw2CEEmGETigCpLbJZwMZB7pmT4vm+iQt3YRXplVN/t3ghOfEqJOOJ
	Ut3edB+n/1OA6fhWrZK1GJbJBBiSa8HF8r3kAv3RWwdtQhsrqbNWrPZ7GnxrPdIiurTPObQFYz+
	lpLrGGXtGfRsO0Vnu67Po4JmiM6QjApOeV8/4K+SGhBvHV/FbhtF9rg4DxEGFp34edewwYfNbBx
	ZyrWUYkoKt+m2x7WwY1gbpSQc0GY0ngzgC3QErsKoysemHLivNjEiJkW6GOMD2hDYDdPY/l2NQo
	n9vaI7HhDKmdM+a3IbHK695wXKd2ZEKdz2sMYq7hRgpo4dKNj3h+os9jkCgTfoBN+Vt1IJ6PIE+
	hKAQ==
X-Received: by 2002:a05:6122:4d18:b0:5ec:1996:43e5 with SMTP id 71dfb90a1353d-5ec68954c28mr6941613e0c.14.1793801050665;
        Wed, 04 Nov 2026 06:04:10 -0800 (PST)
X-Received: by 2002:a05:6122:4d18:b0:5ec:1996:43e5 with SMTP id 71dfb90a1353d-5ec68954c28mr6941124e0c.14.1793801045361;
        Wed, 04 Nov 2026 06:04:05 -0800 (PST)
Received: from brgl-qcom.local ([2a01:cb1d:dc:7e00:8916:7b9b:97a2:6c96])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48fec8d87b5sm3968358f8f.11.2026.11.04.06.04.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Nov 2026 06:04:04 -0800 (PST)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Subject: [PATCH 0/9] gpio: make gpiolib-shared more fwnode-centric
Date: Wed, 04 Nov 2026 15:03:42 +0100
Message-Id: <20261104-fwnode-for-each-prop-v1-0-6e28fe1c72c4@oss.qualcomm.com>
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAD4762oC/x3MQQqAIBBA0avErBuwAq2uEi0kx5yNyggVhHdPW
 r7F/y8UEqYCa/eC0MWFU2wY+g6OYONJyK4ZRjVqtQwa/R2TI/RJkOwRMEvK6IzVflFkpmmGlmY
 hz8+/3fZaP07gX/FmAAAA
X-Change-ID: 20260916-fwnode-for-each-prop-d7a6f90e7338
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Daniel Scally <djrscally@gmail.com>,
        Heikki Krogerus <heikki.krogerus@linux.intel.com>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Danilo Krummrich <dakr@kernel.org>, Johan Hovold <johan@kernel.org>,
        Hans Verkuil <hverkuil@kernel.org>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Kees Cook <kees@kernel.org>, Andy Shevchenko <andy@kernel.org>,
        Len Brown <lenb@kernel.org>, Rob Herring <robh@kernel.org>,
        Saravana Kannan <saravanak@kernel.org>,
        Linus Walleij <linusw@kernel.org>
Cc: linux-acpi@vger.kernel.org, driver-core@lists.linux.dev,
        linux-kernel@vger.kernel.org, linux-hardening@vger.kernel.org,
        devicetree@vger.kernel.org, linux-gpio@vger.kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2525;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=igoKaa0xq26/Z/H02GkPFONZQBTU50ODzHchNUIx+5Q=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBq6ztRL7kg4bDJtRdCt0qBLI2rXZeRzJHDf/XLN
 9rZ0LDl54KJAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCaus7UQAKCRAFnS7L/zaE
 w6/DD/9jj9PILd0dgLPtCIwFuHXC3EySMhKlRRrNt4JLWFlDqcNoMOHDNRBV9tAldlTPM8rmbB/
 Q1uKEBZrqXz+wO63h2Fdr4X9hQgyPXJj/GQtw13cxVrohxGzP7+ld9TVcI0vRXx2e/uIPjZgNmz
 W5gGdNmX0Z+OMItPUIkKVegCrh4N6Egr1RgblvNiXLX2p09m9XG1DjWa3pOVE2iL92qdhbQxJTH
 qVwDHhLUE5QsS89kzFM155xrMZkOxClLKlr8uP1wp3ShjHzXU5dBmhZ+WSAo6mVmVbjsQG/wOYg
 7fj51f4Qz1+9gu2c4wUxC6wjRKBGHscBTf+YUbPUgJfRwyzwZQyC5ZP7Sn30Wyc8V+Fj4ZreXrO
 0GJV0Ytx57k/D6HlVXoCYXzhmJraGZ80UB7ZFE2KXe+aEgewMirOWrLvF8faI9Hfl+WnEwAQUkO
 tIR+gqLgL13i0fhxd7OEBqP3UilPv399umJRoUeL7736OAyyL8mjVoVHGMiyvx92Rj/af1ej8OG
 hmHp66Uw0e66dgra3upvfLUChjaMZIkdd/kE/nisXNUAO13rZk/wSJTzhO63HgM0ZUWk3WasThP
 DscsoeoFsZ7W/TrWCW46mX1GsaIykOI1JXtnJmUbK4/gwHd161RAbbM/qZtMBNXqumNtBYaMK9l
 2dk7ovHOj6KhKJQ==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Proofpoint-ORIG-GUID: 7E_MO5UZqPzyDlTxQnvsVBtjpZeLbcNB
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA0MDA1NSBTYWx0ZWRfXzbiEimZgT0Gj
 BoUm8iPhOszr6ND86GeV6YTCTZ3af6Y7ZtTgcBQhQ08ommXZEA/pCDMjqyyPikKzvQONOmNsnlZ
 NLbtNlu41HYFhZ9FhtqQHaSYOM9SEkIyahUyCprPMP78qSZt9+ZN8UVwEHc+lynYt9/MFYy4+Z0
 NnVI3FwTjvKVruNe8Ik05MsLpNmRykf9/Zpbv5upmxP7QdGDM8s1DJjklR/omkg9MeLZDJDN63t
 phZgc8UVhB0VXccJ85QlA3ftLxN5Tf7owjed5twbrW+Z/naeMeLFRk9dY5jz3xyFco62KHwo8mI
 aDBCLvJK9U8mpDH9OCrLXzQgYubcBKyqXDQpa8Un/u2EG05l80QmeZ/lbOSnA8ctD/2cWRPbWjK
 bpDmSBA5euivk9z9yJ1U37SOFFDhH8ONiDLemh/rPc28NfHe/fV8CfnaczE3sYb0IwuPNuCv20O
 nkCW0mQPae5cgdkxfDA==
X-Proofpoint-GUID: 7E_MO5UZqPzyDlTxQnvsVBtjpZeLbcNB
X-Authority-Analysis: v=2.4 cv=UuP2pOwB c=1 sm=1 tr=0 ts=6aeb3b5b cx=c_pps
 a=1Os3MKEOqt8YzSjcPV0cFA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22 a=EUspDBNiAAAA:8
 a=eP0z8zDUiy-zq6zXBR8A:9 a=QEXdDO2ut3YA:10 a=hhpmQAJR8DioWGSBphRh:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA0MDA1NSBTYWx0ZWRfX8BrQcSp8HdiO
 fV13Gw4UDKbz3wLkidRepEVX3zYVdjhdUp1ywYmfJCZeLWdnxaKyCjqikCpOCAgztUNF1lMrJ/f
 jdr0Ey0obKAjIclxHDKcCxKkmGgiZk4=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-04_04,2026-11-03_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 priorityscore=1501 bulkscore=0 clxscore=1015 adultscore=0
 spamscore=0 impostorscore=0 phishscore=0 malwarescore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610300000 definitions=main-2611040055

Currently the code in gpiolib-shared.c only supports OF nodes and uses a
lot of OF-specific APIs. This series attempts to make the code more
generic, ahead of extending support for sharing GPIOs to other types of
firmware nodes, by defining two new fwnode operations, implementing them
for OF nodes and using them in GPIOLIB in order to limit the OF-specific
API usage to only a few places guarded by ifdefs.

The new fwnode APIs are:
a) property_get_names() - this closes the gap between OF nodes and
   fwnodes: OF nodes allow users to iterate over all properties while
   fwnodes don't advertise all properties in any way at the moment
b) count_references() - there's currently no way of counting references
   in an fwnode reliably: using fwnode_property_get_reference_args()
   does not work for empty references (e.g.: phandle = <0>, <&foo 1 2>;)

The first patch is a fix to fwnode_name_eq(). The second adds a CLASS()
for string arrays. The following 6 define and implement new fwnode
operations. The final patch generalizes the code in gpiolib-shared.c.

Merging strategy: patches 1-8 should go through the driver core tree and
be provided on an immutable branch to me so that I can pull it and queue
the final patch via the GPIO tree.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
---
Bartosz Golaszewski (9):
      device property: fix fwnode_name_eq() for empty node names
      lib: string_helpers: implement a CLASS() for string arrays
      fwnode: define the property_get_names() operation
      device property: provide fwnode_property_get_names()
      of: property: implement the .property_get_names() fwnode operation
      fwnode: define the count_references() fwnode operation
      device property: provide fwnode_property_count_references()
      of: property: implement the count_references() fwnode operation
      gpio: shared: generalize most code to firmware nodes

 drivers/base/property.c        | 114 ++++++++++++++++++-
 drivers/gpio/gpiolib-shared.c  | 241 ++++++++++++++++++++++-------------------
 drivers/of/property.c          |  37 +++++++
 include/linux/fwnode.h         |  15 +++
 include/linux/property.h       |   4 +
 include/linux/string_helpers.h |  12 ++
 6 files changed, 312 insertions(+), 111 deletions(-)
---
base-commit: 6628e7d4c6b25c8d18f1345e3a20d21829aae7e4
change-id: 20260916-fwnode-for-each-prop-d7a6f90e7338

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>

